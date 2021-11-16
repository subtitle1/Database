package service;

import java.sql.SQLException;
import java.util.List;

import dao.CategoryDao;
import dao.CustomerDao;
import dao.FoodDao;
import dao.OrderDao;
import vo.Category;
import vo.Customer;
import vo.Food;
import vo.Order;
import vo.OrderItem;

/**
 * 식품 판매 프로그램의 업무로직이 구현된 클래스다.
 * @author mars
 *
 */
public class AdminService {

	private final CategoryDao categoryDao = new CategoryDao();
	private final CustomerDao customerDao = new CustomerDao();
	private final FoodDao foodDao = new FoodDao();
	private final OrderDao orderDao = new OrderDao();

	private AdminService() {}
	private static AdminService service = new AdminService();
	public static AdminService getInstance() {
		return service;
	}
	
	/**
	 * 모든 식품카테고리정보를 반환한다.
	 * @return 식품 카테고리 정보 목록
	 * @throws SQLException 데이터베이스 오류 발생
	 */
	public List<Category> getAllCategories() throws SQLException {
		// [식품 카테고리 리스트 조회] 메뉴 선택시 실행되는 서비스 메소드다.
		// 모든 식품카테고리 목록을 제공한다.
		return categoryDao.selectAllCategories();
	}
	
	/**
	 * 지정된 카테고리번호의 카테고리정보를 반환한다.
	 * @param categoryNo 카테고리번호
	 * @return 카테고리정보
	 * @throws SQLException 데이터베이스 오류 발생
	 */
	public Category getCategoryByNo(int categoryNo) throws SQLException {
		// [식품 등록] 메뉴 선택시 실행되는 서비스 메소드다.
		// 식품카테고리 정보를 제공한다.
		return categoryDao.selectCategoryByNo(categoryNo);
	}
	
	/**
	 * 모든 식품정보를 반환한다.
	 * @return 식품정보 목록
	 * @throws SQLException 데이터베이스 오류 발생
	 */
	public List<Food> getAllFoods() throws SQLException {
		// [식품 리스트 조회] 메뉴 선택시 실행되는 서비스 메소드다.
		// 모든 식품 목록을 제공한다.
		return foodDao.selectAllFoods();
	}
	
	/**
	 * 지정된 카테고리번호에 해당하는 모든 식품정보를 반환한다.
	 * @param categoryNo 조회할 카테고리번호
	 * @return 식품정보 목록
	 * @throws SQLException 데이터베이스 오류 발생
	 */
	public List<Food> getFoodsByCategory(int categoryNo) throws SQLException {
		// [카테고리별 식품 리스트 조회] 메뉴 선택시 실행되는 서비스 메소드다.
		// 전달받은 카테고리번호에 해당하는 식품목록을 제공한다.
		return foodDao.selectFoodsByCategory(categoryNo);
	}
	
	/**
	 * 지정된 식품번호에 해당하는 식품상세정보를 반환한다.
	 * @param foodNo 조회할 식품번호
	 * @return 식품정보
	 * @throws SQLException 데이터베이스 오류 발생
	 */
	public Food getFoodDetail(int foodNo) throws SQLException {
		// [식품상세 정보 조회] 메뉴 선택시 실행되는 서비스 메소드다.
		// 전달받는 식품번호에 해당하는 식품상세정보를 제공한다.
		return foodDao.selectFoodByNo(foodNo);
	}
	
	/**
	 * 지정된 식품정보를 전달받아서 식품정보를 저장한다.
	 * @param food 식품정보
	 * @throws SQLException 데이터베이스 오류 발생
	 */
	public void addNewFood(Food food) throws SQLException {
		// [식품 등록] 메뉴 선택시 실행되는 서비스 메소드다.
		
		// 동일한 이름의 식품이 테이블에 존재하는지 조회한다.
		Food savedFood = foodDao.selectFoodByName(food.getName());
		// 동일한 이름의 식품이 존재하면 해당 식품의 재고를 증가시킨다.
		if (savedFood != null) {
			savedFood.setStock(savedFood.getStock() + food.getStock());
			foodDao.updateFood(savedFood);
			return;
		}
		// 동일한 이름의 식품이 존재하지 않으면 새 식품으로 테이블에 저장한다.
		foodDao.insertFood(food);
	}
	
	/**
	 * 지정된 고객번호와 주문식품정보를 전달받아서 주문정보와 주문상품정보를 저장한다.
	 * @param customerNo 주문하는 고객번호
	 * @param orderItems 고객이 주문한 식품번호와 식품수량이 포함된 주문식품정보 목록
	 * @throws SQLException
	 */
	public void addNewOrder(int customerNo, List<OrderItem> orderItems) throws SQLException {
		// [주문하기] 메뉴 선택시 실행되는 서비스 메소드다.
		
		// 새 주문번호를 획득한다.
		int orderNo = orderDao.getOrderNo();
		
		// 고객번호에 해당하는 고객정보를 조회한다.
		Customer customer = customerDao.selectCustomerByNo(customerNo);
		
		// 총주문금액을 계산한다.
		int totalPrice = 0;
		for (OrderItem orderItem : orderItems) {
			totalPrice += orderItem.getFood().getPrice() * orderItem.getAmount();
		}
		
		// 주문정보를 Customer객체에 저장하고 테이블에 저장시킨다.
		Order order = new Order();
		order.setNo(orderNo);
		order.setCustomer(customer);
		order.setItems(orderItems);
		order.setTotalPrice(totalPrice);
		orderDao.insertOrder(order);
		
		// 주문아이템정보를 테이블에 저장시킨다.
		for (OrderItem orderItem : orderItems) {
			orderItem.setOrder(order);
			orderDao.insertOrderItem(orderItem);
			
			// 주문한 수량만큼 상품의 재고량을 감소시킨다.
			Food food = orderItem.getFood();
			food.setStock(food.getStock() - orderItem.getAmount());
			foodDao.updateFood(food);
		}
		
		// 적립포인트를 계산한다.
		int depositPoint = (int) (totalPrice*0.01);
		
		// 변경된 적립포인트를 Customer에 저장하고, 테이블에 저장시킨다.
		customer.setPoint(customer.getPoint() + depositPoint);
		customerDao.updateCustomer(customer);
	}
	/**
	 * 모든 주문정보를 반환한다.
	 * @return 주문정보 리스트
	 * @throws SQLException 데이터베이스 오류 발생
	 */
	public List<Order> getAllOrders() throws SQLException {
		// [전체 주문내역 조회] 메뉴 선택시 실행되는 서비스 메소드다.
		// 전체 주문정보 목록를 반환한다.
		return orderDao.selectAllOrders();
	}
	
	/**
	 * 지정된 고객번호에 해당하는 고객의 주문정보들을 반환한다.
	 * @param customerNo 고객번호
	 * @return 주문정보 리스트
	 * @throws SQLException 데이터베이스 오류 발생
	 */
	public List<Order> getOrdersByCustomerNo(int customerNo) throws SQLException {
		// [고객상세 정보 및 주문내역 조회] 메뉴 선택시 실행되는 서비스 메소드다.
		// 고객번호에 해당하는 주문정보 목록를 반환한다.
		return orderDao.selectOrdersByCustomerNo(customerNo);
	}
	
	/**
	 * 지정된 주문번호에 해당하는 주문정보를 반환한다. 
	 * @param orderNo 조회할 주문번호
	 * @return 주문정보(주문정보와 주문식품목록을 포함한다)
	 * @throws SQLException 데이터베이스 오류 발생
	 */
	public Order getOrderDetail(int orderNo) throws SQLException {
		// [주문상세 조회] 메뉴 선택시 실행되는 서비스 메소드다.
		
		// 주문번호에 해당하는 주문정보를 조회한다.
		Order order = orderDao.selectOrderByNo(orderNo);
		// 주문번호에 해당하는 주문아이템리스트를 조회한다.
		List<OrderItem> orderItems = orderDao.selectOrderItemsByOrderNo(orderNo);
		// 주문아이템리스트를 주문정보에 저장해서 반환한다.
		order.setItems(orderItems);
		
		return order;
	}
	
	/**
	 * 모든 고객정보를 반환한다
	 * @return 고객정보 목록
	 * @throws SQLException 데이터베이스 오류 발생
	 */
	public List<Customer> getAllCustomers() throws SQLException {
		// [고객 리스트 조회] 메뉴 선택시 실행되는 서비스 메소드다.
		// 모든 고객정보를 반환한다.
		return customerDao.selectAllCustomers();
	}
	
	/**
	 * 지정된 고객번호에 해당하는 고객상세정보를 반환한다.
	 * @param customerNo 고객번호
	 * @return 고객정보
	 * @throws SQLException
	 */
	public Customer getCustomer(int customerNo) throws SQLException {
		// [고객상세 정보 및 주문내역 조회] 메뉴 선택시 실행되는 서비스 메소드다.
		// 고객상세정보를 반환한다.
		return customerDao.selectCustomerByNo(customerNo);
	}
	
	/**
	 * 고객이름과 전화번호를 전달받아서 새 고객정보를 저장한다.
	 * @param name 고객이름
	 * @param tel 고객 전화번호
	 * @throws SQLException 데이터베이스 오류 발생
	 */
	public void addNewCustomer(String name, String tel) throws SQLException {
		// [고객 등록] 메뉴 선택시 실행되는 서비스 메소드다.
		// 전달받은 고객정보를 저장한다.

		// 전화번호로 고객정보를 조회한다.
		Customer savedCustomer = customerDao.selectCustomerByTel(tel);
		// 테이블에 저장된 고객정보가 존재하면 RuntimeException 예외를 발생시킨다.
		if (savedCustomer != null) {
			throw new RuntimeException("동일한 전화번호로 가입된 고객이 존재합니다.");
		}
		
		// 고객정보가 존재하지 않으면 Customer객체를 생성해서 고객정보를 저장하고, 테이블에 저장시킨다.
		Customer customer = new Customer();
		customer.setName(name);
		customer.setTel(tel);
		
		customerDao.insertCustomer(customer);
		
	}
}
