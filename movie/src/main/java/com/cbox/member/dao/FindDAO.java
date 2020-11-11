package com.cbox.member.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cbox.common.DAO;
import com.cbox.member.vo.MemberVO;

public class FindDAO extends DAO {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private MemberVO vo;
	
	private final String FINDID = "SELECT MBR_ID FROM MEMBER "
			+ "WHERE MBR_NM = ? AND MBR_BIRTH = ? AND MBR_PHONE = ?";
	private final String FINDPW = "SELECT MBR_PW FROM MEMBER "
			+ "WHERE MBR_ID = ? AND MBR_NM = ? AND MBR_PHONE = ?";

	public MemberVO searchId(MemberVO vo) {
		try {
			pstmt = conn.prepareStatement(FINDID);
			pstmt.setString(1, vo.getMbr_nm());
			pstmt.setDate(2, vo.getMbr_birth());
			pstmt.setString(3, vo.getMbr_phone());
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setMbr_id(rs.getString("mbr_id"));
				System.out.println("아이디:" + vo.getMbr_id());
            }
		} catch (Exception e) {
            e.printStackTrace();
        } finally {
        	close();
        }
        return vo;
	}
	public MemberVO searchPw(MemberVO vo) {
		try {
			pstmt = conn.prepareStatement(FINDPW);
			pstmt.setString(1, vo.getMbr_id());
			pstmt.setString(2, vo.getMbr_nm());
			pstmt.setString(3, vo.getMbr_phone());
			rs = pstmt.executeQuery();
			if(rs.next()){
				vo.setMbr_pw(rs.getString("mbr_pw"));
            }
		} catch (Exception e) {
            e.printStackTrace();
        } finally {
        	close();
        }
        return vo;
	}
	private void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
