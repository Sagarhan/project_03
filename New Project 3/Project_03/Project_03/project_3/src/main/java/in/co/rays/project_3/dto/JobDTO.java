package in.co.rays.project_3.dto;

import java.util.Date;

public class JobDTO extends BaseDTO{

	
	private String title;
	private Date openingjob;
	private String status;
	private String experience;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getOpeningjob() {
		return openingjob;
	}
	public void setOpeningjob(Date openingjob) {
		this.openingjob = openingjob;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
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
