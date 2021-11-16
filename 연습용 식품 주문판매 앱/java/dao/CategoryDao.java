package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.ConnectionUtil;
import vo.Category;

/**
 * 식품 카테고리정보를 제공하는 클래스다.
 * @author mars
 *
 */
public class CategoryDao {

	/**
	 * 모든 카테고리 정보를 반환한다.
	 * @return 카테고리정보 목록
	 * @throws SQLException 데이터베이스 엑세스 작업 오류시 발생
	 */
	public List<Category> selectAllCategories() throws SQLException {
		List<Category> categories = new ArrayList<>();
		String sql = "select category_no, category_name "
				   + "from tb_sample_food_categories "
				   + "order by category_no asc ";
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			Category category = new Category();
			category.setNo(rs.getInt("category_no"));
			category.setName(rs.getString("category_name"));
			
			categories.add(category);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return categories;
	}

	/**
	 * 지정된 카테고리번호에 해당하는 카테고리정보를 반환한다.
	 * @param categoryNo 카테고리번호
	 * @return 카테고리 정보
	 * @throws SQLException 데이터베이스 엑세스 작업 오류시 발생
	 */
	public Category selectCategoryByNo(int categoryNo) throws SQLException {
		Category category = null;
		
		String sql = "select category_no, category_name "
				   + "from tb_sample_food_categories "
				   + "where category_no = ? ";
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, categoryNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			category = new Category();
			category.setNo(rs.getInt("category_no"));
			category.setName(rs.getString("category_name"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return category;
	}
	
}
