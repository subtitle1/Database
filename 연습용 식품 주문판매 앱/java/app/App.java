package app;

import static utils.KeyboardUtil.*;

import java.lang.Exception;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.AdminService;
import vo.Category;
import vo.Customer;
import vo.Food;
import vo.Order;
import vo.OrderItem;

public class App {
	
	private AdminService service = AdminService.getInstance();

	public App() {
		System.out.println("[식품 판매 프로그램]");
		menu();
	}
	
	private void menu() {
		try {
			System.out.println("[메인 메뉴 목록]");
			System.out.println("====================================================================================================");
			System.out.println("1.조회  2.등록  3.주문  0.종료");
			System.out.println("====================================================================================================");
			
			System.out.print("메인 메뉴 선택: ");
			int menuNo = readInt();
			
			if (menuNo == 1) {
				searchMenu();
			} else if (menuNo == 2) {
				registerMenu();
			} else if (menuNo == 3) {
				orderMenu();
			} else if (menuNo == 0) {
				System.out.println("[프로그램 종료]");
				System.out.println("### 프로그램을 종료합니다.");
				close();
				System.exit(0);
			}
			
			System.out.println();
			System.out.println();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} 
		menu();
	}
	
	private void searchMenu() throws SQLException {
		while (true) {
			System.out.println();
			System.out.println();
			System.out.println("[조회 메뉴 목록]");
			System.out.println("====================================================================================================");
			System.out.println("1.카테고리 2.식품목록 3.카테고리별 식품목록  4.식품정보  5.고객리스트 6.고객상세정보 7.주문상세정보 0.종료");
			System.out.println("====================================================================================================");
			
			System.out.print("조회 메뉴 선택: ");
			int menuNo = readInt();
			System.out.println();
			
			if (menuNo == 1) {
				searchCategories();
			} else if (menuNo == 2) {
				searchFoodList();
			} else if (menuNo == 3) {
				searchFoodListByCategory();
			} else if (menuNo == 4) {
				searchFoodInfo();
			} else if (menuNo == 5) {
				searchCustomerList();
			} else if (menuNo == 6) {
				searchCustomerInfo();
			} else if (menuNo == 7) {
				searchCustomerOrderList();
			} else if (menuNo == 0) {
				System.out.println("[조회 작업 종료]");
				System.out.println("### [안내] 조회작업을 종료하고 메인 메뉴로 돌아갑니다.");
				return;
			}
		}		
	}
	
	private void searchCategories() throws SQLException {
		System.out.println("[식품 카테고리 리스트 조회]");
		System.out.println("### 등록된 모든 식품카테고리를 출력합니다.");
		
		//  모든 카테고리 정보를 조회한다.
		List<Category> categoryList = service.getAllCategories();
		
		System.out.println("[식품 카테고리 리스트]");
		System.out.println("----------------------------------------------------------------------------------------------------");
		System.out.println("카테고리번호\t카테고리이름");
		System.out.println("----------------------------------------------------------------------------------------------------");
		//  모든 카테고리 목록을 출력합니다.
		for (Category category : categoryList) {
			System.out.println(category.getNo() + "\t" + category.getName());
		}
		System.out.println("----------------------------------------------------------------------------------------------------");
	}
	
	private void searchFoodList() throws SQLException {
		System.out.println("[식품 리스트 조회]");
		System.out.println("### 등록된 모든 식품들을 출력합니다.");
		
		//  모든 식품정보를 조회한다.
		List<Food> foodList = service.getAllFoods();
		
		System.out.println("[식품 리스트]");
		System.out.println("----------------------------------------------------------------------------------------------------");
		System.out.println("식품번호\t카테고리\t식품이름\t식품가격\t판매여부");
		System.out.println("----------------------------------------------------------------------------------------------------");
		//  모든 식품목록을 출력합니다.
		for (Food food : foodList) {
			System.out.print(food.getNo() + "\t");
			System.out.print(food.getCategory().getName() + "\t");
			System.out.print(food.getName() + "\t");
			System.out.print(food.getPrice() + "\t");
			System.out.println(food.getOnSale());
		}
		System.out.println("----------------------------------------------------------------------------------------------------");
	}
	
	private void searchFoodListByCategory() throws SQLException {
		System.out.println("[카테고리별 식품 리스트 조회]");
		System.out.println("### 카테고리번호를 입력받아서 해당 카테고리의 식품들을 출력합니다.");
		
		System.out.print("### 카테고리번호 입력: ");
		//  카테고리번호를 입력받아서 해당 카테고리의 식품리스트를 조회한다.
		int categoryNo = readInt();
		List<Food> foodList = service.getFoodsByCategory(categoryNo);
		
		System.out.println("[카테고리별 식품 리스트]");
		System.out.println("----------------------------------------------------------------------------------------------------");
		System.out.println("식품번호\t카테고리\t식품이름\t식품가격\t판매여부");
		System.out.println("----------------------------------------------------------------------------------------------------");
		//  식품목록을 출력합니다.
		for (Food food : foodList) {
			System.out.print(food.getNo() + "\t");
			System.out.print(food.getCategory().getName() + "\t");
			System.out.print(food.getName() + "\t");
			System.out.print(food.getPrice() + "\t");
			System.out.println(food.getOnSale());
		}
		System.out.println("----------------------------------------------------------------------------------------------------");
	}
	
	private void searchFoodInfo() throws SQLException {
		System.out.println("[식품상세 정보 조회]");
		System.out.println("### 식품번호를 입력받아서 해당 식품의 상세정보를 출력합니다.");
		
		System.out.print("### 식품번호 입력: ");
		//  식품번호를 입력받아서 해당 식품의 상세정보를 조회한다.
		int foodNo = readInt();
		Food food = service.getFoodDetail(foodNo);
		
		System.out.println("[식품상세 정보]");
		System.out.println("----------------------------------------------------------------------------------------------------");
		//  식품정보을 출력합니다.
		System.out.println("식품번호: " + food.getNo());
		System.out.println("카테고리 이름: " + food.getCategory().getName());
		System.out.println("식품명: " + food.getName());
		System.out.println("식품가격: " + food.getPrice());
		System.out.println("식품재고: " + food.getStock());
		System.out.println("판매상태: " + food.getOnSale());
		System.out.println("----------------------------------------------------------------------------------------------------");
	}
	
	private void searchCustomerList() throws SQLException {
		System.out.println("[고객 리스트 조회]");
		System.out.println("### 등록된 모든 고객들을 출력합니다.");
		
		//  모든 고객정보를 조회한다.
		List<Customer> customerList = service.getAllCustomers();
		
		System.out.println("[고객 리스트]");
		System.out.println("----------------------------------------------------------------------------------------------------");
		System.out.println("고객번호\t고객명\t전화번호\t입실/퇴실");
		System.out.println("----------------------------------------------------------------------------------------------------");
		//  모든 고객목록을 출력합니다.
		for (Customer customer : customerList) {
			System.out.print(customer.getNo() + "\t");
			System.out.print(customer.getName() + "\t");
			System.out.print(customer.getTel() + "\t");
			System.out.println(customer.getInOut());
		}
		System.out.println("----------------------------------------------------------------------------------------------------");
	}
	
	private void searchCustomerInfo() throws SQLException {
		System.out.println("[고객상세 정보 및 주문내역 조회]");
		System.out.println("### 고객번호를 입력받아서 해당 고객의 상세정보와 주문내역를 출력합니다.");
		
		System.out.print("### 고객번호 입력: ");
		//  고객번호를 입력받아서 해당 고객의 상세정보를 조회한다.
		int customerNo = readInt();
		Customer customer = service.getCustomer(customerNo);
		//  고객번호를 입력받아서 해당 고객의 주문내역정보를 조회한다.
		List<Order> orderList = service.getOrdersByCustomerNo(customerNo);
		
		System.out.println("[고객정보]");
		System.out.println("----------------------------------------------------------------------------------------------------");
		//  고객정보을 출력합니다.
		System.out.println("고객번호: " + customer.getNo());
		System.out.println("고객이름: " + customer.getName());
		System.out.println("전화번호: " + customer.getTel());
		System.out.println("포인트: " + customer.getPoint());
		System.out.println("입실/퇴실: " + customer.getInOut());
		System.out.println("가입일자: " + customer.getCreatedDate());
		System.out.println("----------------------------------------------------------------------------------------------------");
		
		
		System.out.println("[주문내역]");
		System.out.println("----------------------------------------------------------------------------------------------------");
		System.out.println("주문번호\t고객명\t총주문금액\t주문상태\t주문날짜");
		System.out.println("----------------------------------------------------------------------------------------------------");
		//  고객의 주문내역을 출력한다.
		if (orderList.isEmpty()) {
			System.out.println("### 주문내역이 존재하지 않습니다.");
		} else {
			for (Order order : orderList) {
				System.out.print(order.getNo() + "\t");
				System.out.print(order.getCustomer().getName() + "\t");
				System.out.print(order.getTotalPrice() + "\t");
				System.out.print(order.getStatus() + "\t");
				System.out.println(order.getCreatedDate());
			}
		}
		System.out.println("----------------------------------------------------------------------------------------------------");
	}
	
	private void searchCustomerOrderList() throws SQLException {
		System.out.println("[내 주문내역 조회]");
		System.out.println("### 고객번호를 입력받아서 해당 고객의 주문내역를 출력합니다.");
		
		System.out.print("### 고객번호 입력: ");
		//  고객번호를 입력받아서 해당 고객의 상세정보를 조회한다.
		int customerNo = readInt();
		//  고객번호를 입력받아서 해당 고객의 주문내역정보를 조회한다.
		List<Order> orderList = service.getOrdersByCustomerNo(customerNo);
		
		System.out.println("[주문내역]");
		System.out.println("----------------------------------------------------------------------------------------------------");
		System.out.println("주문번호\t고객명\t총주문금액\t주문상태\t주문날짜");
		System.out.println("----------------------------------------------------------------------------------------------------");
		//  고객의 주문내역을 출력한다.
		if (orderList.isEmpty()) {
			System.out.println("### 주문내역이 존재하지 않습니다.");
		} else {
			for (Order order : orderList) {
				System.out.print(order.getNo() + "\t");
				System.out.print(order.getCustomer().getName() + "\t");
				System.out.print(order.getTotalPrice() + "\t");
				System.out.print(order.getStatus() + "\t");
				System.out.println(order.getCreatedDate());
			}
		}
		System.out.println("----------------------------------------------------------------------------------------------------");
		
	}
	
	private void registerMenu() throws SQLException {
		while (true) {
			System.out.println();
			System.out.println();
			System.out.println("[등록 메뉴 목록]");
			System.out.println("====================================================================================================");
			System.out.println("1.식품등록 2.고객등록 0.종료");
			System.out.println("====================================================================================================");
			
			System.out.print("등록 메뉴 선택: ");
			int menuNo = readInt();
			System.out.println();
			
			if (menuNo == 1) {
				registerFood();
			} else if (menuNo == 2) {
				registerCustomer();
			} else if (menuNo == 0) {
				System.out.println("[등록 작업 종료]");
				System.out.println("### [안내] 등록작업을 종료하고 메인 메뉴로 돌아갑니다.");
				return;
			}
		}
	}
	
	private void registerFood() throws SQLException {
		System.out.println("[식품 등록]");
		System.out.println("### 식품정보를 입력받아서 등록합니다.");
		
		//  신규 식품정보를 입력받는다.
		System.out.print("### 식품이름 입력: ");
		String name = readString();
		System.out.print("### 식품가격 입력: ");
		int price = readInt();
		System.out.print("### 식품입고량 입력: ");
		int stock = readInt();
		System.out.print("### 식품카테고리번호 입력: ");
		int categoryNo = readInt();
		
		//  카테고리번호에 해당하는 카테고리 정보를 조회한다.
		Category category = service.getCategoryByNo(categoryNo);
		//  신규 식품정보를 Food객체에 저장한다.
		Food food = new Food();
		food.setCategory(category);
		food.setName(name);
		food.setPrice(price);
		food.setStock(stock);
		//  신규 식품정보를 데이터베이스에 등록시킨다.
		service.addNewFood(food);
		
		System.out.println("### [안내] 식품정보가 등록되었습니다.");
	}
	
	private void registerCustomer() throws SQLException {
		System.out.println("[고객 등록]");
		System.out.println("### 고객정보를 입력받아서 등록합니다.");
		
		//  신규 고객정보를 입력받는다.
		System.out.print("### 고객이름 입력: ");
		String name = readString();
		System.out.print("### 고객전화번호 입력: ");
		String tel = readString();
		
		//  신규 고객정보를 데이터베이스에 등록시킨다.
		service.addNewCustomer(name, tel);
		
		System.out.println("### [안내] 고객정보가 등록되었습니다.");
	}
	
	private void orderMenu() throws SQLException {
		while (true) {
			System.out.println();
			System.out.println();
			System.out.println("[주문 메뉴 목록]");
			System.out.println("====================================================================================================");
			System.out.println("1.주문하기 2.전체 주문내역 조회 3.주문 상세정보 0.종료");
			System.out.println("====================================================================================================");
			
			System.out.print("주문 메뉴 선택: ");
			int menuNo = readInt();
			System.out.println();
			
			if (menuNo == 1) {
				order();
			} else if (menuNo == 2) {
				orderList();
			}else if (menuNo == 3) {
				orderDetail();
			} else if (menuNo == 0) {
				System.out.println("[주문 작업 종료]");
				System.out.println("### [안내] 주문작업을 종료하고 메인 메뉴로 돌아갑니다.");
				return;
			}
		}
	}
	
	private void order() throws SQLException {
		System.out.println("[주문하기]");
		System.out.println("### 주문정보를 입력받아서 등록합니다.");
		
		//  고객번호와 주문아이템정보를 입력받는다.
		System.out.print("### 고객번호 입력: ");
		int customerNo = readInt();
		System.out.print("### 식품번호와 구매수량 입력(입력예시-5001:3,5003:1): ");// 상품번호:수량,상품번호:수량,상품번호:수량 형식으로 입력한다.
		String text = readString();	//	"5001:3,5003:1"
		
		//  주문아이템정보 문자열을 분석해서 식품번호와 구매수량을 조회하고 OrderItem을 생성해서 저장한다.
		List<OrderItem> orderItemList = new ArrayList<>();
		String[] splitedTextArray = text.split(",");			// "5001:3,5003:1" -> {"5001:3", "5003:1"}
		for (String splitedText : splitedTextArray) {			// splitedText = "5001:3"
			int foodNo = Integer.parseInt(splitedText.substring(0, 4));
			int amount = Integer.parseInt(splitedText.substring(5));
			
			//  상품번호에 해당하는 상품정보를 조회한다.
			Food food = service.getFoodDetail(foodNo);

			//  주문아이템정보를 OrderItem에 저장한다.
			OrderItem orderItem = new OrderItem();
			orderItem.setFood(food);
			orderItem.setAmount(amount);
			
			orderItemList.add(orderItem);
		}
		
		//  고객번호와 주문상품아이템을 데이터베이스에 저장시킨다.
		service.addNewOrder(customerNo, orderItemList);
		
		System.out.println("### [안내] 주문정보가 등록되었습니다.");
	}
	
	private void orderList() throws SQLException {
		System.out.println("[전체 주문내역 조회]");
		System.out.println("### 전체 주문내역을 출력합니다.");
		
		//  전체 주문내역정보를 조회한다.
		List<Order> orderList = service.getAllOrders();
		
		System.out.println("[전체 주문내역]");
		System.out.println("----------------------------------------------------------------------------------------------------");
		System.out.println("주문번호\t고객명\t총주문금액\t주문상태\t주문날짜");
		System.out.println("----------------------------------------------------------------------------------------------------");
		//  전체 주문내역을 출력한다.
		for (Order order : orderList) {
			System.out.print(order.getNo() + "\t");
			System.out.print(order.getCustomer().getName() + "\t");
			System.out.print(order.getTotalPrice() + "\t");
			System.out.print(order.getStatus() + "\t");
			System.out.println(order.getCreatedDate());
		}
		System.out.println("----------------------------------------------------------------------------------------------------");
	}
	
	private void orderDetail() throws SQLException {
		System.out.println("[주문 상세정보]");
		System.out.println("### 주문번호를 입력받아서 해당 주문의 상세정보를 출력합니다.");
		
		//  주문번호를 입력받는다.
		System.out.print("### 주문번호 입력: ");
		int orderNo = readInt();
		
		//  주문번호에 해당하는 주문상세정보를 조회한다. 주문상세정보에는 주문정보와 주문식품리스트가 포함되어 있다.
		Order order = service.getOrderDetail(orderNo);
		
		System.out.println("[주문상세 정보]");
		System.out.println("----------------------------------------------------------------------------------------------------");
		//  주문정보을 출력합니다.
		System.out.println("주문번호: " + order.getNo());
		System.out.println("고객이름: " + order.getCustomer().getName());
		System.out.println("총주문가격: " + order.getTotalPrice());
		System.out.println("주문상태: " + order.getStatus());
		System.out.println("주문날짜: " + order.getCreatedDate());
		System.out.println("----------------------------------------------------------------------------------------------------");
		
		//  주문정보에서 주문아이템리스트를 조회한다.
		List<OrderItem> orderItemList = order.getItems();

		System.out.println("[주문식품 리스트]");
		System.out.println("----------------------------------------------------------------------------------------------------");
		System.out.println("상품번호\t상품이름\t상품가격\t구매수량\t구매가격");
		System.out.println("----------------------------------------------------------------------------------------------------");
		//  주문아이템리스트를 출력한다.
		for (OrderItem orderItem : orderItemList) {
			System.out.print(orderItem.getFood().getNo() + "\t");
			System.out.print(orderItem.getFood().getName() + "\t");
			System.out.print(orderItem.getFood().getPrice() + "\t");
			System.out.print(orderItem.getAmount() + "\t");
			System.out.println(orderItem.getFood().getPrice() * orderItem.getAmount());
		}
		System.out.println("----------------------------------------------------------------------------------------------------");
	}
	
	public static void main(String[] args) {
		new App();
	}
	
}
