package com.cbox.movie.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cbox.common.DAO;
import com.cbox.movie.vo.MovieVO;

public class MovieDAO extends DAO {
	private PreparedStatement psmt; // sql ��ɹ� ����
	private ResultSet rs; // select �� ��� �� ����
	private MovieVO vo;
	
	private final String SELECT_ALL = "select * from movie order by 1";
}
