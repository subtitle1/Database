package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import utils.ConnectionUtil;
import vo.Customer;

/**
 * 고객정보 등록, 조회, 변경 기능을 제공하는 클래스다.
 * @author mars
 *
 */
public class CustomerDao {

	/**
	 * 모든 고객정보를 반환한다.
	 * @return 고객정보 목록
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public List<Customer> selectAllCustomers() throws SQLException {
		List<Customer> customers = new ArrayList<>();
		String sql = "select customer_no, customer_name, customer_tel, customer_point, customer_in_out, customer_created_date "
				   + "from tb_sample_food_customers "
				   + "order by customer_no desc ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			customers.add(rowToCustomer(rs));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return customers;
	}
	
	/**
	 * 지정된 고객번호에 해당하는 고객정보를 반환한다.
	 * @param customerNo 고객번호
	 * @return 고객정보, null이 반환될 수도 있다.
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public Customer selectCustomerByNo(int customerNo) throws SQLException {
		Customer customer = null;
		String sql = "select customer_no, customer_name, customer_tel, customer_point, customer_in_out, customer_created_date "
				   + "from tb_sample_food_customers "
				   + "where customer_no = ? ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, customerNo);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			customer = rowToCustomer(rs);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return customer;
	}
	
	/**
	 * 지정된 전화번호를 가진 고객정보를 반환한다.
	 * @param customerTel 전화번호
	 * @return 고객정보, null이 반환될 수도 있다.
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public Customer selectCustomerByTel(String customerTel) throws SQLException {
		Customer customer = null;
		String sql = "select customer_no, customer_name, customer_tel, customer_point, customer_in_out, customer_created_date "
				   + "from tb_sample_food_customers "
				   + "where customer_tel = ? ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, customerTel);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			customer = rowToCustomer(rs);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return customer;
	}
	
	/**
	 * 신규 고객정보를 전달받아서 저장한다.
	 * @param customer 신규 고객정보
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public void insertCustomer(Customer customer) throws SQLException {
		String sql = "insert into tb_sample_food_customers "
				   + "(customer_no, customer_name, customer_tel) "
				   + "values "
				   + "(customer_seq.nextval, ?, ?)";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, customer.getName());
		pstmt.setString(2, customer.getTel());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 변경된 정보가 포함된 고객정보를 전달받아서 업데이트한다.
	 * @param customer 고객정보
	 * @throws SQLException 데이터베이스 엑세스 오류 발생시
	 */
	public void updateCustomer(Customer customer) throws SQLException {
		String sql = "update tb_sample_food_customers "
				   + "set "
				   + "	customer_name = ?, "
				   + "  customer_tel = ?, "
				   + "	customer_point = ?, "
				   + "  customer_in_out = ? "
				   + "where customer_no = ? ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setString(1, customer.getName());
		pstmt.setString(2, customer.getTel());
		pstmt.setInt(3, customer.getPoint());
		pstmt.setString(4, customer.getInOut());
		pstmt.setInt(5, customer.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	private Customer rowToCustomer(ResultSet rs) throws SQLException {
		Customer customer = new Customer();
		customer.setNo(rs.getInt("customer_no"));
		customer.setName(rs.getString("customer_name"));
		customer.setTel(rs.getString("customer_tel"));
		customer.setPoint(rs.getInt("customer_point"));
		customer.setInOut(rs.getString("customer_in_out"));
		customer.setCreatedDate(rs.getDate("customer_created_date"));
		return customer;
	}
}
