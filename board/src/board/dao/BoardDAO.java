package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import board.model.BoardDTO;
import board.model.BoardEntity;

public class BoardDAO {
	public static void insBoard(BoardEntity vo) {		
		Connection con = null;
		PreparedStatement ps = null;
		
		String sql = "INSERT INTO t_board"
				+ " (title, ctnt)"
				+ " VALUES"
				+ " (?, ?)";
		try {
			con = DbUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getCtnt());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtils.close(con, ps);
		}
	}
	
	public static List<BoardEntity> selBoardList(BoardDTO param) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = " SELECT i_board, title, r_dt FROM t_board "
				+ " ORDER BY i_board DESC "
				+ " LIMIT ?, ? ";
		
		try {
			con = DbUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, param.getStartIdx());
			ps.setInt(2, param.getRowCountPerPage());
			rs = ps.executeQuery();
			List<BoardEntity> list = new ArrayList<>();
			while(rs.next()) {
				BoardEntity vo = new BoardEntity();
				vo.setI_board(rs.getInt("i_board"));
				vo.setTitle(rs.getString("title"));
				vo.setR_dt(rs.getString("r_dt"));
				list.add(vo);
			}
			return list;
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			DbUtils.close(con, ps, rs);
		}		
		return null;
	}
	
	public static BoardEntity selBoard(BoardEntity param) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT title, ctnt, r_dt FROM t_board WHERE i_board = ?";
		
		try {
			con = DbUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, param.getI_board());			
			rs = ps.executeQuery();
			
			if(rs.next()) {				
				String title = rs.getString("title");
				String ctnt = rs.getString("ctnt");
				String r_dt = rs.getString("r_dt");
				
				BoardEntity vo = new BoardEntity();
				vo.setTitle(title);
				vo.setCtnt(ctnt);
				vo.setR_dt(r_dt);
				vo.setI_board(param.getI_board());
				return vo;
			}
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			DbUtils.close(con, ps, rs);
		}	
		return null;
	}
	
	public static int selPageLength(BoardDTO param) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT CEIL(COUNT(i_board) / ?) FROM t_board";
		
		try {
			con = DbUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, param.getRowCountPerPage());
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1); 
			}
			
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			DbUtils.close(con, ps, rs);
		}
		return 0;
	}
	
	public static void updBoard(BoardEntity param) {
		Connection con = null;
		PreparedStatement ps = null;		
		String sql = "UPDATE t_board SET title = ?, ctnt = ? WHERE i_board = ?";		
		try {
			con = DbUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, param.getTitle());
			ps.setString(2, param.getCtnt());
			ps.setInt(3, param.getI_board());			
			ps.executeUpdate();
		} catch (Exception e) {		
			e.printStackTrace();
		} finally {
			DbUtils.close(con, ps);
		}
	}
	
	public static void delBoard(BoardEntity param) {
		Connection con = null;
		PreparedStatement ps = null;		
		String sql = "DELETE FROM t_board WHERE i_board = ?";		
		try {
			con = DbUtils.getCon();
			ps = con.prepareStatement(sql);
			ps.setInt(1, param.getI_board());			
			ps.executeUpdate();
		} catch (Exception e) {		
			e.printStackTrace();
		} finally {
			DbUtils.close(con, ps);
		}
	}
}