package com.cbox.movie.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cbox.common.Action;

public class movieListFormAction implements Action {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		return "jsp/user/movie/movieList.jsp";
	}

}
