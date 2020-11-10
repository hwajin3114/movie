package com.cbox.reservation.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.reservation.vo.UserReservVO;

public class UserReservDAO extends DAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private UserReservVO vo;
	
	private String SELECT_RESERV_LIST = "SELECT * FROM (SELECT A.*, ROWNUM RN FROM ( " + 
					"SELECT TC.TC_NUM, MV.MV_TITLE, TT.TT_SCR_DATE, " + 
					"TT.TT_START, TC.TC_ST_NUM, TH.TH_NAME FROM TICKETING TC " + 
					"JOIN TIMETABLE TT ON TT.TT_NUM = TC.TT_NUM " + 
					"JOIN MOVIE MV ON MV.MV_NUM = TT.MV_NUM " + 
					"JOIN THEATER TH ON TH.TH_NUM = TT.TH_NUM " + 
					"JOIN MEMBER MBR ON MBR.MBR_NO = TC.MBR_NO " + 
					"WHERE MBR.MBR_NO = ? ORDER BY TC.TC_NUM )A )B WHERE RN BETWEEN ? AND ?";
	private String COUNT_RESERV = "SELECT COUNT(TC.TC_NUM) " + 
						"FROM TICKETING TC, MEMBER MBR " + 
						"WHERE MBR.MBR_NO = ?";
	private String SELECT_ONE_RESERV = "SELECT * FROM (SELECT A.*, ROWNUM RN FROM ( " + 
					"SELECT TC.TC_NUM, TC.TC_DATE, MV.MV_TITLE, MV.MV_AGE, TT.TT_SCR_DATE, " + 
					"TT.TT_START, TT.TT_END, TC.TC_ST_NUM, TH.TH_NAME " + 
					"FROM TICKETING TC JOIN TIMETABLE TT ON TT.TT_NUM = TC.TT_NUM " + 
					"JOIN MOVIE MV ON MV.MV_NUM = TT.MV_NUM " + 
					"JOIN THEATER TH ON TH.TH_NUM = TT.TH_NUM " + 
					"JOIN MEMBER MBR ON MBR.MBR_NO = TC.MBR_NO " + 
					"WHERE MBR.MBR_NO = ? AND TC.TC_NUM = ? )A )B";
	
	public UserReservVO userReservOne(UserReservVO vo) {
		try {
			pstmt = conn.prepareStatement(SELECT_ONE_RESERV);
			pstmt.setInt(1, vo.getMbr_no());
			pstmt.setInt(2, vo.getTc_num());
			rs = pstmt.executeQuery();
			if(rs.next()){
//				vo.setMbr_no(rs.getInt("mbr_no"));
//				vo.setMbr_id(rs.getString("mbr_id"));
//				vo.setMbr_pw(rs.getString("mbr_pw"));
//				vo.setMbr_nm(rs.getString("mbr_nm")); 
//				vo.setMbr_birth(rs.getDate("mbr_birth"));
//				vo.setMbr_email(rs.getString("mbr_email"));
//				vo.setMbr_phone(rs.getString("mbr_phone"));
//				vo.setMbr_regi_date(rs.getDate("mbr_regi_date"));
//				vo.setMbr_point(rs.getInt("mbr_point"));
//				vo.setMbr_e_yn(rs.getString("mbr_e_yn"));
//				vo.setMbr_author(rs.getString("mbr_author"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        	close();
        }
        return vo;
	}
	
	public List<UserReservVO> userReservList(UserReservVO uvo){
		List<UserReservVO> list = new ArrayList<UserReservVO>();
		try {
			pstmt = conn.prepareStatement(SELECT_RESERV_LIST);
			pstmt.setInt(1, uvo.getMbr_no());
			pstmt.setInt(2, uvo.getFirst());
			pstmt.setInt(3, uvo.getLast());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new UserReservVO();
				vo.setMv_title(rs.getString("mv_title"));
				vo.setTt_scr_date(rs.getString("tt_scr_date"));
				vo.setTt_start(rs.getString("tt_start")); 
				vo.setTc_st_num(rs.getString("tc_st_num"));
				vo.setTh_name(rs.getString("th_name"));
				vo.setTc_num(rs.getInt("tc_num"));
				
				list.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	public int count(UserReservVO uvo) {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(COUNT_RESERV);
			pstmt.setInt(1, uvo.getMbr_no());
			
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}