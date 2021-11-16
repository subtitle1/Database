package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.ConnectionUtil;
import vo.Category;
import vo.Food;

/**
 * 식품정보 조회, 등록, 변경기능을 제공하는 클래스다.
 * @author mars
 *
 */
public class FoodDao {

	/**
	 * 모든 식품정보를 반환한다.
	 * @return 식품정보 목록
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public List<Food> selectAllFoods() throws SQLException {
		List<Food> foods = new ArrayList<>();
		
		String sql = "select F.food_no, F.food_name, F.food_price, F.food_stock, F.food_on_sale, C.category_no, C.category_name "
				   + "from tb_sample_foods F, tb_sample_food_categories C "
				   + "where F.category_no = C.category_no "
				   + "order by F.food_no asc ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			foods.add(rowToFood(rs));
		}
		
		rs.close();
		pstmt.close();	
		connection.close();
		
		return foods;
	}
	
	/**
	 * 지정된 카테고리번호에 해당하는 식품정보를 반환한다.
	 * @param categoryNo 카테고리번호
	 * @return 식품정보 목록
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public List<Food> selectFoodsByCategory(int categoryNo) throws SQLException {
		List<Food> foods = new ArrayList<>();
		
		String sql = "select F.food_no, F.food_name, F.food_price, F.food_stock, F.food_on_sale, C.category_no, C.category_name "
				   + "from tb_sample_foods F, tb_sample_food_categories C "
				   + "where F.category_no = C.category_no "
				   + "and F.category_no = ? ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, categoryNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			foods.add(rowToFood(rs));
		}
		
		rs.close();
		pstmt.close();	
		connection.close();
		
		return foods;
	}
	
	/**
	 * 지정된 식품번호에 해당하는 식품정보를 반환한다.
	 * @param foodNo 식품번호
	 * @return 식품정보, null이 반환될 수 있다.
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public Food selectFoodByNo(int foodNo) throws SQLException {
		Food food = null;		
		String sql = "select F.food_no, F.food_name, F.food_price, F.food_stock, F.food_on_sale, C.category_no, C.category_name "
				   + "from tb_sample_foods F, tb_sample_food_categories C "
				   + "where F.category_no = C.category_no "
				   + "and F.food_no = ? ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, foodNo);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			food = rowToFood(rs);
		}
		
		rs.close();
		pstmt.close();	
		connection.close();
		
		return food;
	}
	
	/**
	 * 지정된 식품이름에 해당하는 식품정보를 반환한다.
	 * @param foodName 식품이름
	 * @return 식품정보, null이 반환될 수 있다.
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public Food selectFoodByName(String foodName) throws SQLException {
		Food food = null;		
		String sql = "select F.food_no, F.food_name, F.food_price, F.food_stock, F.food_on_sale, C.category_no, C.category_name "
				   + "from tb_sample_foods F, tb_sample_food_categories C "
				   + "where F.category_no = C.category_no "
				   + "and F.food_name = ? ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, foodName);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			food = rowToFood(rs);
		}
		
		rs.close();
		pstmt.close();	
		connection.close();
		
		return food;
	}
	
	/**
	 * 새 식품정보를 전달받아서 저장한다.
	 * @param food 식품정보
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public void insertFood(Food food) throws SQLException {
		String sql = "insert into tb_sample_foods "
				   + "(food_no, food_name, food_price, food_stock, category_no) "
				   + "values "
				   + "(food_seq.nextval, ?, ?, ?, ?) ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, food.getName());
		pstmt.setInt(2, food.getPrice());
		pstmt.setInt(3, food.getStock());
		pstmt.setInt(4, food.getCategory().getNo());
		pstmt.executeUpdate();
		
		pstmt.close();	
		connection.close();
	}
	
	/**
	 * 변경된 정보가 포함된 식품정보를 전달받아서 업데이트한다.
	 * @param food 식품정보
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public void updateFood(Food food) throws SQLException {
		String sql = "update tb_sample_foods "
				   + "set "
				   + "	food_name = ?, "
				   + "	food_price = ?, "
				   + "	food_stock = ?, "
				   + "	food_on_sale = ?, "
				   + "	category_no = ? "
				   + "where food_no = ? ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, food.getName());
		pstmt.setInt(2, food.getPrice());
		pstmt.setInt(3, food.getStock());
		pstmt.setString(4, food.getOnSale());
		pstmt.setInt(5, food.getCategory().getNo());
		pstmt.setInt(6, food.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();	
		connection.close();		   
	}
	
	private Food rowToFood(ResultSet rs) throws SQLException {
		Food food = new Food();
		food.setNo(rs.getInt("food_no"));
		food.setName(rs.getString("food_name"));
		food.setPrice(rs.getInt("food_price"));
		food.setStock(rs.getInt("food_stock"));
		food.setOnSale(rs.getString("food_on_sale"));
		
		Category category = new Category();
		category.setNo(rs.getInt("category_no"));
		category.setName(rs.getString("category_name"));
		food.setCategory(category);
		
		return food;
	}
}
