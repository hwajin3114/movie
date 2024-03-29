package com.cbox.movie.command;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.json.JSONObject;

import com.cbox.common.Action;
import com.cbox.common.FileRenamePolicy;
import com.cbox.common.FileUtil;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.vo.MovieVO;

public class mvRegistAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 값을 vo에 저장해서 결과.jsp로 넘김
		// 여기서 올바르게 저장됐으면 목록으로 실패했으면 팝업창이 뜨도록하기..흠

		MovieDAO dao = new MovieDAO();
		MovieVO vo = new MovieVO();

		vo.setMvTitle(request.getParameter("mvTitle"));
		vo.setMvDir(request.getParameter("mvDir"));
		vo.setStrdate(Date.valueOf(request.getParameter("strdate")));
		vo.setFindate(Date.valueOf(request.getParameter("findate")));
		vo.setMvType(request.getParameter("mvType"));
		vo.setMvAge(request.getParameter("mvAge"));
		vo.setMvCha(request.getParameter("mvCha"));
		vo.setMvSum(request.getParameter("mvSum"));
		vo.setMvCont(request.getParameter("mvCont"));

//		vo.setMvPost("testposter.png");
//		vo.setMvImg("testposter.png");
//		vo.setMvTeaser("testTeaser.mp4");

		String addPath = request.getServletContext().getRealPath("/images");

		// 포스터 : 단일
		try {
			Part part = request.getPart("mvPost");
			String fileName = FileUtil.extractFileName(part);
			if (!fileName.equals("")) {
				String uploadFile = addPath + File.separator + fileName; // File.separator 구분기호?
//				File renameFile = FileRenamePolicy.rename(new File(uploadFile));
				part.write(new File(uploadFile).getAbsolutePath()); // 절대경로

				vo.setMvPost(new File(uploadFile).getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 스틸컷 : 단일
		try {
			Part part = request.getPart("mvImg");
			String fileName = FileUtil.extractFileName(part);
			if (!fileName.equals("")) {
				String uploadFile = addPath + File.separator + fileName; // File.separator 구분기호?
//				File renameFile = FileRenamePolicy.rename(new File(uploadFile));
				part.write(new File(uploadFile).getAbsolutePath()); // 절대경로

				vo.setMvImg(new File(uploadFile).getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 티저 : 단일
		try {
			Part part = request.getPart("mvTeaser");
			String fileName = FileUtil.extractFileName(part);
			if (!fileName.equals("")) {
				String uploadFile = addPath + File.separator + fileName; // File.separator 구분기호?
//				File renameFile = FileRenamePolicy.rename(new File(uploadFile));
				part.write(new File(uploadFile).getAbsolutePath()); // 절대경로

				vo.setMvTeaser(new File(uploadFile).getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		dao.movieInsert(vo);

		try {
			response.getWriter().print("{\"result\":true}");
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

}
