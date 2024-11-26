package in.co.rays.project_3.dto;

public class OrderDTO extends BaseDTO{

	
	private String customername;
	private long phone;
	private String address;
	private String product;
	private int amount;
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		customername = customername;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String getKey() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String getValue() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
