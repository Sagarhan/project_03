package in.co.rays.project_3.dto;

import java.util.Date;

public class FavoriteDTO extends BaseDTO{
	
	private String product;
	private Date addeddate;
	private String customerusername;
	private String notesorcomments;

	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public Date getAddeddate() {
		return addeddate;
	}
	public void setAddeddate(Date addeddate) {
		this.addeddate = addeddate;
	}
	public String getCustomerusername() {
		return customerusername;
	}
	public void setCustomerusername(String customerusername) {
		this.customerusername = customerusername;
	}
	public String getNotesorcomments() {
		return notesorcomments;
	}
	public void setNotesorcomments(String notesorcomments) {
		this.notesorcomments = notesorcomments;
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
