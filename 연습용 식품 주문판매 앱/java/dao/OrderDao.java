package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.ConnectionUtil;
import vo.Category;
import vo.Customer;
import vo.Food;
import vo.Order;
import vo.OrderItem;

/**
 * 주문정보 조회, 등록, 변경 기능을 제공하는 클래스다.
 * @author mars
 *
 */
public class OrderDao {

	/**
	 * 모든 주문정보를 반환한다.
	 * @return 주문정보 목록
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public List<Order> selectAllOrders() throws SQLException {
		List<Order> orders = new ArrayList<>();
		String sql = "select O.order_no, O.customer_no, C.customer_name, O.order_total_price, O.order_status, O.order_created_date "
				   + "from tb_sample_food_orders O, tb_sample_food_customers C "
				   + "where O.customer_no = C.customer_no "
				   + "order by O.order_no desc ";
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			orders.add(rowToOrder(rs));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return orders;
	}


	/**
	 * 지정된 고객번호에 해당하는 고객이 주문한 주문정보를 반환한다.
	 * @param customerNo 고객번호
	 * @return 주문번호 목록
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public List<Order> selectOrdersByCustomerNo(int customerNo) throws SQLException {
		List<Order> orders = new ArrayList<>();
		String sql = "select O.order_no, O.customer_no, C.customer_name, O.order_total_price, O.order_status, O.order_created_date "
				   + "from tb_sample_food_orders O, tb_sample_food_customers C "
				   + "where O.customer_no = C.customer_no "
				   + "and O.customer_no = ? "
				   + "order by O.order_no desc ";
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, customerNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			orders.add(rowToOrder(rs));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return orders;
	}
	
	/**
	 * 지정된 주문번호에 해당하는 주문정보를 반환한다.
	 * @param orderNo 주문번호
	 * @return 주문정보
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public Order selectOrderByNo(int orderNo) throws SQLException {
		Order order = null;
		String sql = "select O.order_no, O.customer_no, C.customer_name, O.order_total_price, O.order_status, O.order_created_date "
				   + "from tb_sample_food_orders O, tb_sample_food_customers C "
				   + "where O.customer_no = C.customer_no "
				   + "and order_no = ? ";
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			order = rowToOrder(rs);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return order;
	}
	
	/**
	 * 지정된 주문번호에 해당하는 주문의 주문아이템정보를 반환한다.
	 * @param orderNo 주문번호
	 * @return 주문아이템정보 목록
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public List<OrderItem> selectOrderItemsByOrderNo(int orderNo) throws SQLException {
		String sql = "select O.order_no, O.food_amount, O.food_no, F.food_name, F.food_price, F.category_no, C.category_name "
				   + "from tb_sample_food_order_items O, tb_sample_foods F, tb_sample_food_categories C "
				   + "where O.food_no = F.food_no "
				   + "and F.category_no = C.category_no "
				   + "and O.order_no = ? "
				   + "order by F.food_name asc ";
		List<OrderItem> orderItems = new ArrayList<>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, orderNo);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			OrderItem item = new OrderItem();
			Category category = new Category();
			Food food = new Food();
			
			category.setNo(rs.getInt("category_no"));
			category.setName(rs.getString("category_name"));
			
			food.setNo(rs.getInt("food_no"));
			food.setName(rs.getString("food_name"));
			food.setPrice(rs.getInt("food_price"));
			food.setCategory(category);
			
			item.setFood(food);
			item.setAmount(rs.getInt("food_amount"));
			
			orderItems.add(item);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return orderItems;
	}
	
	/**
	 * 새 주문번호를 반환한다.
	 * @return 새 주문번호
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public int getOrderNo() throws SQLException {
		String sql = "select foodorder_seq.nextval seq from dual";
		
		int orderNo = 0;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		orderNo = rs.getInt("seq");
		rs.close();
		pstmt.close();
		connection.close();
		
		return orderNo;
	}
	
	/**
	 * 신규 주문정보를 저장한다.
	 * @param order 주문정보
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public void insertOrder(Order order) throws SQLException {
		String sql = "insert into tb_sample_food_orders "
				   + "(order_no, customer_no, order_total_price) "
				   + "values "
				   + "(?, ?, ?) ";
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, order.getNo());
		pstmt.setInt(2, order.getCustomer().getNo());
		pstmt.setInt(3, order.getTotalPrice());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 신규 주문아이템정보를 저장한다.
	 * @param item 주문아이템정보
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public void insertOrderItem(OrderItem item) throws SQLException {
		String sql = "insert into tb_sample_food_order_items "
				   + "(order_no, food_no, food_amount) "
				   + "values "
				   + "(?, ?, ?) ";
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, item.getOrder().getNo());
		pstmt.setInt(2, item.getFood().getNo());
		pstmt.setInt(3, item.getAmount());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 변경된 정보가 포함된 주문정보를 전달받아서 업데이트 한다.
	 * @param order 주문정보
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public void updateOrder(Order order) throws SQLException {
		String sql = "update tb_sample_food_orders "
				   + "set "
				   + "	customer_no = ?,"
				   + "	order_total_Price = ?, "
				   + "	order_status = ? "
				   + "where order_no = ? ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, order.getCustomer().getNo());
		pstmt.setInt(2, order.getTotalPrice());
		pstmt.setString(3, order.getStatus());
		pstmt.setInt(4, order.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
				   
	}
	
	private Order rowToOrder(ResultSet rs) throws SQLException {
		Order order = new Order();
		Customer customer = new Customer();
		
		order.setNo(rs.getInt("order_no"));
		order.setTotalPrice(rs.getInt("order_total_price"));
		order.setStatus(rs.getString("order_status"));
		order.setCreatedDate(rs.getDate("order_created_date"));
		
		customer.setNo(rs.getInt("customer_no"));
		customer.setName(rs.getString("customer_name"));
		
		order.setCustomer(customer);
		
		return order;
	}


}
