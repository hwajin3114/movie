package com.cbox.movie.command;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.cbox.common.Action;
import com.cbox.common.FileRenamePolicy;
import com.cbox.common.FileUtil;
import com.cbox.movie.dao.MovieDAO;
import com.cbox.movie.vo.MovieVO;

public class mvUpdateAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("mvUpdateAction");
		MovieDAO dao = new MovieDAO();
		MovieVO vo = new MovieVO();

		vo.setMvNum(Integer.parseInt(request.getParameter("mvNum")));
		vo.setMvTitle(request.getParameter("mvTitle"));
		vo.setMvDir(request.getParameter("mvDir"));
		vo.setStrdate(Date.valueOf(request.getParameter("strdate")));
		vo.setFindate(Date.valueOf(request.getParameter("findate")));
		vo.setMvType(request.getParameter("mvType"));
		vo.setMvAge(request.getParameter("mvAge"));
		vo.setMvCha(request.getParameter("mvCha"));
		vo.setMvSum(request.getParameter("mvSum"));
		vo.setMvCont(request.getParameter("mvCont"));


		// 아...... 이전이미지는 있는데 새로 등록된 이미지가 없을 경우에는 그 이전 이미지를 그대로 저장하도록 해야함
		String addPath = request.getServletContext().getRealPath("/images");
		// 포스터 : 단일
		try {
			Part part = request.getPart("mvPost");
			String fileName = FileUtil.extractFileName(part);
			if (!fileName.equals("")) {
				String uploadFile = addPath + File.separator + fileName; // File.separator 구분기호?
				File renameFile = FileRenamePolicy.rename(new File(uploadFile));
				part.write(renameFile.getAbsolutePath()); // 절대경로

				vo.setMvPost(renameFile.getName());
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
				File renameFile = FileRenamePolicy.rename(new File(uploadFile));
				part.write(renameFile.getAbsolutePath()); // 절대경로

				vo.setMvImg(renameFile.getName());
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
				File renameFile = FileRenamePolicy.rename(new File(uploadFile));
				part.write(renameFile.getAbsolutePath()); // 절대경로

				vo.setMvTeaser(renameFile.getName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		dao.movieUpdate(vo);
		System.out.println("update 끝");

		try {
			response.getWriter().print("{\"result\":true}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}