package com.cbox.reservation.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cbox.common.Action;
import com.cbox.common.Paging;
import com.cbox.reservation.dao.UserReservDAO;
import com.cbox.reservation.vo.UserReservVO;

public class UserReservListAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		UserReservDAO udao = new UserReservDAO();
		List<UserReservVO> list = new ArrayList<UserReservVO>();
		
		HttpSession session = request.getSession();
		int sno = (int) session.getAttribute("mbr_no");
		
		String strp = request.getParameter("p");
		int p = 1;
		if (strp != null && !strp.equals("")) {
			p = Integer.parseInt(strp);
		}
		Paging paging = new Paging();
		paging.setPage(p);
		
		UserReservDAO cntdao = new UserReservDAO();
		UserReservVO uvo = new UserReservVO();
		
		uvo.setMbr_no(sno);
		uvo.setFirst(paging.getFirst());
		uvo.setLast(paging.getLast());
		paging.setTotalRecord(cntdao.count(uvo));
		request.setAttribute("paging", paging);
		list = udao.userReserv_list(uvo);
		request.setAttribute("userReservList", list);
		
		return "jsp/user/reservation/UserReservList.jsp";
	}

}
