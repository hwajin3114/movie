package com.cbox.movie.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cbox.common.DAO;
import com.cbox.movie.vo.MovieSearchVO;
import com.cbox.movie.vo.MovieVO;
import com.cbox.movie.vo.ReviewVO;

public class MovieDAO extends DAO {

	private PreparedStatement psmt;
	private ResultSet rs;
	private MovieVO vo;

	private String SELECT_ALL = "SELECT * FROM MOVIE";
//	private String SELECT_ALL = "SELECT * FROM (SELECT MV.MV_NUM, MV.MV_TITLE, MV.MV_STRDATE, MV.MV_CONT, AVG(RV_RANK) AS RV_RANK " + 
//			"FROM MOVIE MV, REVIEW RV " + 
//			"WHERE MV.MV_NUM = RV.MV_NUM " + 
//			"GROUP BY MV.MV_NUM, MV_TITLE, MV.MV_STRDATE, MV.MV_CONT) A";
	private String SELECT_SEARCH = "";
	private String SELECT_EXPECTED = "SELECT * FROM MOVIE WHERE MV_STRDATE > SYSDATE"; // 상영 예정작
//	private final String DETAIL = "SELECT * FROM MOVIE WHERE MV_NUM = ?";
	private String DETAIL = "";
//	private final String UPDATE = "UPDATE MOVIE SET MV_DIR=?, MV_CHA=?, MV_STRDATE=?, MV_FINDATE=?, MV_SUM=?, MV_TYPE=?, MV_CONT=?, MV_IMG=?, MV_TEASER=?, MV_POST=?, MV_AGE=? WHERE MV_NUM = ?";
	private final String UPDATE = "UPDATE MOVIE SET MV_DIR=?, MV_CHA=?, MV_STRDATE=?, MV_FINDATE=?, MV_SUM=?, MV_TYPE=?, MV_CONT=?, MV_AGE=? WHERE MV_NUM = ?";
	private final String DELETE = "DELETE FROM MOVIE WHERE MV_NUM=?";

	private final String INSERT = "INSERT INTO MOVIE(MV_NUM, MV_TITLE, MV_DIR, MV_CHA, MV_STRDATE, MV_FINDATE, MV_SUM, MV_TYPE, MV_CONT, MV_IMG, MV_TEASER, MV_POST, MV_AGE)"
			+ "VALUES (MV_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,?)";

	public List<MovieVO> selectAll(MovieSearchVO searchVO) {
		List<MovieVO> list = new ArrayList<MovieVO>();
		String whereCondition = " WHERE 1=1";

		if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
				&& !searchVO.getKeyword().equals("")) {
			if (searchVO.getType().equals("title")) {
				whereCondition += " AND MV_TITLE LIKE '%'||?||'%'";
			} else if (searchVO.getType().equals("chkType")) {
				if (searchVO.getKeyword().equals("ing")) {
					whereCondition += " AND MV_FINDATE > SYSDATE";
				}
			}
		}
		
		try {
			SELECT_ALL = SELECT_ALL + whereCondition;
			psmt = conn.prepareStatement(SELECT_ALL);

			int pos = 1;
			if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
					&& !searchVO.getKeyword().equals("")) {
				if (searchVO.getType().equals("title")) {
					psmt.setString(pos++, searchVO.getKeyword());
				}
			}
			rs = psmt.executeQuery();

			while (rs.next()) {
				vo = new MovieVO();
				vo.setMvNum(rs.getInt("mv_num"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setMvDir(rs.getString("mv_dir"));
				vo.setMvCha(rs.getString("mv_cha"));
				vo.setStrdate(rs.getDate("mv_strdate"));
				vo.setFindate(rs.getDate("mv_findate"));
				vo.setMvSum(rs.getString("mv_sum"));
				vo.setMvType(rs.getString("mv_type"));
				vo.setMvCont(rs.getString("mv_cont"));
				vo.setMvPost(rs.getString("mv_post"));
				vo.setMvImg(rs.getString("mv_img"));
				vo.setMvTeaser(rs.getString("mv_teaser"));
				vo.setMvAge(rs.getString("mv_age"));

				// todo : 평균 평점은 해당 영화번호를 가진 review들의 평점을 계산해서
				vo.setMvRank(rs.getDouble("mv_rank"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public List<MovieVO> selectPage(MovieSearchVO searchVO) {
		List<MovieVO> list = new ArrayList<MovieVO>();
		String whereCondition = " WHERE 1=1";
		if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
				&& !searchVO.getKeyword().equals("")) {
			if (searchVO.getType().equals("title")) {
				whereCondition += " AND MV_TITLE LIKE '%'||?||'%'";
			}
		}

		try {
			SELECT_SEARCH = "SELECT B.* FROM ( SELECT A.*, ROWNUM RN FROM ( " + "SELECT * FROM MOVIE" + whereCondition
					+ " ORDER BY 5 DESC ) A  ) B WHERE RN BETWEEN ? AND ?";
			psmt = conn.prepareStatement(SELECT_SEARCH);
//			psmt = conn.prepareStatement(SELECT_PAGE);
//			psmt.setInt(1, searchVO.getFirst());
//			psmt.setInt(2, searchVO.getLast());
			int pos = 1;
			if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
					&& !searchVO.getKeyword().equals("")) {
				if (searchVO.getType().equals("title")) {
					psmt.setString(pos++, searchVO.getKeyword());
				}
			}
			psmt.setInt(pos++, searchVO.getStart());
			psmt.setInt(pos++, searchVO.getEnd());
			rs = psmt.executeQuery();

			while (rs.next()) {
				vo = new MovieVO();
				vo.setMvNum(rs.getInt("mv_num"));
				vo.setRowNum(rs.getInt("rn"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setMvDir(rs.getString("mv_dir"));
				vo.setMvCha(rs.getString("mv_cha"));
				vo.setStrdate(rs.getDate("mv_strdate"));
				vo.setFindate(rs.getDate("mv_findate"));
				vo.setMvSum(rs.getString("mv_sum"));
				vo.setMvType(rs.getString("mv_type"));
				vo.setMvCont(rs.getString("mv_cont"));
				vo.setMvPost(rs.getString("mv_post"));
				vo.setMvImg(rs.getString("mv_img"));
				vo.setMvTeaser(rs.getString("mv_teaser"));
				vo.setMvAge(rs.getString("mv_age"));

				// todo : 평균 평점은 해당 영화번호를 가진 review들의 평점을 계산해서
				vo.setMvRank(rs.getDouble("mv_rank"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public int count(MovieSearchVO searchVO) { // 전체 건수 조회
		int cnt = 0;
		try {
			String whereCondition = " WHERE 1=1";
			if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
					&& !searchVO.getKeyword().equals("")) {
				if (searchVO.getType().equals("title")) {
					whereCondition += " AND MV_TITLE AND '%'||?||'%'";
				}
			}
			String sql = "SELECT COUNT(*) FROM MOVIE" + whereCondition;
			psmt = conn.prepareStatement(sql);

			int pos = 1;
			if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
					&& !searchVO.getKeyword().equals("")) {
				if (searchVO.getType().equals("title")) {
					psmt.setString(pos++, searchVO.getKeyword());
				}
			}

			rs = psmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1); // 첫번쨰열. 카운트 결과
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	public List<MovieVO> selectExpect(MovieSearchVO searchVO) {
		List<MovieVO> list = new ArrayList<MovieVO>();
		String whereCondition = "";

		if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
				&& !searchVO.getKeyword().equals("")) {
			if (searchVO.getType().equals("title")) {
				whereCondition += " AND MV_TITLE LIKE '%'||?||'%'";
			}
		}

		try {
			SELECT_EXPECTED = SELECT_EXPECTED + whereCondition;
			psmt = conn.prepareStatement(SELECT_EXPECTED);

			int pos = 1;
			if (searchVO.getType() != null && !searchVO.getType().equals("") && searchVO.getKeyword() != null
					&& !searchVO.getKeyword().equals("")) {
				if (searchVO.getType().equals("title")) {
					psmt.setString(pos++, searchVO.getKeyword());
				}
			}
			rs = psmt.executeQuery();

			while (rs.next()) {
				vo = new MovieVO();
				vo.setMvNum(rs.getInt("mv_num"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setMvDir(rs.getString("mv_dir"));
				vo.setMvCha(rs.getString("mv_cha"));
				vo.setStrdate(rs.getDate("mv_strdate"));
				vo.setFindate(rs.getDate("mv_findate"));
				vo.setMvSum(rs.getString("mv_sum"));
				vo.setMvType(rs.getString("mv_type"));
				vo.setMvCont(rs.getString("mv_cont"));
				vo.setMvPost(rs.getString("mv_post"));
				vo.setMvImg(rs.getString("mv_img"));
				vo.setMvTeaser(rs.getString("mv_teaser"));
				vo.setMvAge(rs.getString("mv_age"));

				// todo : 평균 평점은 해당 영화번호를 가진 review들의 평점을 계산해서
//				vo.setMvRank(rs.getInt("mv_rank"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public MovieVO getMovieDetail(MovieVO vo) {
		try {
			String CHK = "SELECT * FROM REVIEW WHERE MV_NUM = ?";
			psmt = conn.prepareStatement(CHK);
			psmt.setInt(1, vo.getMvNum());

			rs = psmt.executeQuery();

			if (rs.next()) {
				DETAIL = "SELECT MV.MV_NUM, MV.MV_TITLE, MV.MV_DIR, MV.MV_CHA, MV.MV_STRDATE, MV.MV_FINDATE, MV.MV_SUM, MV.MV_TYPE, MV.MV_CONT, MV.MV_IMG, MV.MV_TEASER, MV.MV_POST, MV.MV_AGE, ROUND(AVG(RV.RV_RANK),2) AS MV_RANK " + 
						"FROM MOVIE MV, REVIEW RV WHERE MV.MV_NUM = RV.MV_NUM AND MV.MV_NUM = ? " + 
						"GROUP BY MV.MV_NUM, MV.MV_TITLE, MV.MV_DIR, MV.MV_CHA, MV.MV_STRDATE, MV.MV_FINDATE, MV.MV_SUM, MV.MV_TYPE, MV.MV_CONT, MV.MV_IMG, MV.MV_TEASER, MV.MV_POST, MV.MV_AGE";
			} else {
				DETAIL = "SELECT * FROM MOVIE WHERE MV_NUM = ?";
			}
			
			
			psmt = conn.prepareStatement(DETAIL);
			psmt.setInt(1, vo.getMvNum());

			rs = psmt.executeQuery();

			if (rs.next()) {
				vo.setMvNum(rs.getInt("mv_num"));
				vo.setMvTitle(rs.getString("mv_title"));
				vo.setMvDir(rs.getString("mv_dir"));
				vo.setMvCha(rs.getString("mv_cha"));
				vo.setStrdate(rs.getDate("mv_strdate"));
				vo.setFindate(rs.getDate("mv_findate"));
				vo.setMvSum(rs.getString("mv_sum"));
				vo.setMvType(rs.getString("mv_type"));
				vo.setMvCont(rs.getString("mv_cont"));
				vo.setMvPost(rs.getString("mv_post"));
				vo.setMvImg(rs.getString("mv_img"));
				vo.setMvTeaser(rs.getString("mv_teaser"));
				vo.setMvRank(rs.getDouble("mv_rank"));
				vo.setMvAge(rs.getString("mv_age"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}

	public void movieInsert(MovieVO vo) {
		try {
			psmt = conn.prepareStatement(INSERT);

			psmt.setString(1, vo.getMvTitle());
			psmt.setString(2, vo.getMvDir());
			psmt.setString(3, vo.getMvCha());
			psmt.setDate(4, vo.getStrdate());
			psmt.setDate(5, vo.getFindate());
			psmt.setString(6, vo.getMvSum());
			psmt.setString(7, vo.getMvType());
			psmt.setString(8, vo.getMvCont());
			psmt.setString(9, vo.getMvImg());
			psmt.setString(10, vo.getMvTeaser());
			psmt.setString(11, vo.getMvPost());
			psmt.setString(12, vo.getMvAge());

			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void movieUpdate(MovieVO vo) {
		try {
			psmt = conn.prepareStatement(UPDATE);

			psmt.setString(1, vo.getMvDir());
			psmt.setString(2, vo.getMvCha());
			psmt.setDate(3, vo.getStrdate());
			psmt.setDate(4, vo.getFindate());
			psmt.setString(5, vo.getMvSum());
			psmt.setString(6, vo.getMvType());
			psmt.setString(7, vo.getMvCont());
//			psmt.setString(8, vo.getMvImg());
//			psmt.setString(9, vo.getMvTeaser());
//			psmt.setString(10, vo.getMvPost());
			psmt.setString(8, vo.getMvAge());
			psmt.setInt(9, vo.getMvNum());

			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public void movieDelete(MovieVO vo) {
		try {
			psmt = conn.prepareStatement(DELETE);
			psmt.setInt(1, vo.getMvNum());

			psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	// 리뷰 상세
	private String SELECT_REVIEW = "SELECT * " + 
			"FROM MEMBER MBR, MOVIE MV, REVIEW RV " + 
			"WHERE MBR.MBR_NO = RV.MBR_NO " + 
			"AND MV.MV_NUM = RV.MV_NUM " + 
			"AND MV.MV_NUM = ?";
	public List<ReviewVO> getReviewDetail(MovieVO vo) {
		ReviewVO rvVO = new ReviewVO();
		List<ReviewVO> list = new ArrayList<ReviewVO>();
		try {
			psmt = conn.prepareStatement(SELECT_REVIEW);
			psmt.setInt(1, vo.getMvNum());

			rs = psmt.executeQuery();
			while(rs.next()) {
				rvVO = new ReviewVO();
				rvVO.setRvNum(rs.getInt("rv_num"));
				rvVO.setRvCont(rs.getString("rv_cont"));
				rvVO.setRvRank(rs.getDouble("rv_rank"));
				rvVO.setRvDate(rs.getDate("rv_date"));
				rvVO.setMbrId(rs.getString("mbr_id"));
				rvVO.setMbrNum(rs.getInt("mbr_no"));
				rvVO.setMvTitle(rs.getString("mv_title"));
				rvVO.setMvNum(rs.getInt("mv_num"));
				
				list.add(rvVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 모든 동작 후 연결 끊어주기
	private void close() {
		try {
			// 열어준거의 반대방향으로 닫아준다.
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
