package in.co.rays.project_3.model;

import java.util.HashMap;
import java.util.ResourceBundle;

/**
 * ModelFactory decides which model implementation run
 * 
 * @author Sagar Hans
 *
 */
public final class ModelFactory { /* Make Class Final */

	private static ResourceBundle rb = ResourceBundle.getBundle("in.co.rays.project_3.bundle.system");
	private static final String DATABASE = rb.getString("DATABASE");

	private static ModelFactory mFactory = null; /* Declare Static Variable */
	private static HashMap modelCache = new HashMap();

	private ModelFactory() { /* Define Private Constructor */

	}

	public static ModelFactory getInstance() { /* Return Instance */
		if (mFactory == null) {
			mFactory = new ModelFactory();
		}
		return mFactory;
	}

	public UserModelInt getUserModel() {
		// UserModelInt userModel = null;
		UserModelInt userModel = (UserModelInt) modelCache.get("userModel");
		System.out.println(userModel);
		if (userModel == null) {

			if ("Hibernate".equals(DATABASE)) {
				userModel = new UserModelHibImp();
			}
			if ("JDBC".equals(DATABASE)) {
				userModel = new UserModelJDBCImpl();
			}
			System.out.println(DATABASE);
			modelCache.put("userModel", userModel);
		}

		return userModel;
	}

	public TransportModelInt getTransportModel() {
		// UserModelInt userModel = null;
		TransportModelInt Tmodel = (TransportModelInt) modelCache.get("Tmodel");
		System.out.println(Tmodel);
		if (Tmodel == null) {

			if ("Hibernate".equals(DATABASE)) {
				Tmodel = new TransportModelHibImpl();
			}
			modelCache.put("Tmodel", Tmodel);
		}

		return Tmodel;
	}

	 

	public PatientModelInt getPatientModel() {

		PatientModelInt patientModel = (PatientModelInt) modelCache.get("departmentModel");
		if (patientModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				patientModel = (PatientModelInt) new PatientModelHibImp();
			}
			/*
			 * if ("JDBC".equals(DATABASE)) { bankModel = new UserModelJDBCImpl(); }
			 */
			modelCache.put("patientModel", patientModel);
		}
		return patientModel;

	}

	public MarksheetModelInt getMarksheetModel() {
		MarksheetModelInt marksheetModel = (MarksheetModelInt) modelCache.get("marksheetModel");
		if (marksheetModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				marksheetModel = new MarksheetModelHibImp();
			}
			if ("JDBC".equals(DATABASE)) {
				marksheetModel = new MarksheetModelJDBCImpl();
			}
			modelCache.put("marksheetModel", marksheetModel);
		}
		return marksheetModel;
	}

	public CollegeModelInt getCollegeModel() {
		CollegeModelInt collegeModel = (CollegeModelInt) modelCache.get("collegeModel");
		if (collegeModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				collegeModel = new CollegeModelHibImp();

			}
			if ("JDBC".equals(DATABASE)) {
				collegeModel = new CollegeModelJDBCImpl();
			}
			modelCache.put("collegeModel", collegeModel);
		}
		return collegeModel;
	}

	public RoleModelInt getRoleModel() {
		RoleModelInt roleModel = (RoleModelInt) modelCache.get("roleModel");
		if (roleModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				roleModel = new RoleModelHibImp();

			}
			if ("JDBC".equals(DATABASE)) {
				roleModel = new RoleModelJDBCImpl();
			}
			modelCache.put("roleModel", roleModel);
		}
		return roleModel;
	}

	public StudentModelInt getStudentModel() {
		StudentModelInt studentModel = (StudentModelInt) modelCache.get("studentModel");
		if (studentModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				studentModel = new StudentModelHibImp();
			}
			if ("JDBC".equals(DATABASE)) {
				studentModel = new StudentModelJDBCImpl();
			}
			modelCache.put("studentModel", studentModel);
		}

		return studentModel;
	}

	public CourseModelInt getCourseModel() {
		CourseModelInt courseModel = (CourseModelInt) modelCache.get("courseModel");
		if (courseModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				courseModel = new CourseModelHibImp();
			}
			if ("JDBC".equals(DATABASE)) {
				courseModel = new CourseModelJDBCImpl();
			}
			modelCache.put("courseModel", courseModel);
		}

		return courseModel;
	}

	public TimetableModelInt getTimetableModel() {

		TimetableModelInt timetableModel = (TimetableModelInt) modelCache.get("timetableModel");

		if (timetableModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				timetableModel = new TimetableModelHibImp();
			}
			if ("JDBC".equals(DATABASE)) {
				timetableModel = new TimetableModelJDBCImpl();
			}
			modelCache.put("timetableModel", timetableModel);
		}

		return timetableModel;
	}

	public SubjectModelInt getSubjectModel() {
		SubjectModelInt subjectModel = (SubjectModelInt) modelCache.get("subjectModel");
		if (subjectModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				subjectModel = new SubjectModelHibImp();
			}
			if ("JDBC".equals(DATABASE)) {
				subjectModel = new SubjectModelJDBCImpl();
			}
			modelCache.put("subjectModel", subjectModel);
		}

		return subjectModel;
	}

	public FacultyModelInt getFacultyModel() {
		FacultyModelInt facultyModel = (FacultyModelInt) modelCache.get("facultyModel");
		if (facultyModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				facultyModel = new FacultyModelHibImp();
			}
			if ("JDBC".equals(DATABASE)) {
				facultyModel = new FacultyModelJDBCImpl();
			}
			modelCache.put("facultyModel", facultyModel);
		}

		return facultyModel;
	}

	 

	public OwnerModelInt getOwnerModel() {

		OwnerModelInt ownerModel = (OwnerModelInt) modelCache.get("ownerModel");
		if (ownerModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				ownerModel = new OwnerModelHibImp();
			}

			modelCache.put("ownerModel", ownerModel);
		}

		return ownerModel;
	}

	public JobModelInt getJobModel() {

		JobModelInt jobModel = (JobModelInt) modelCache.get("jobModel");
		if (jobModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				jobModel = new JobModelHibImp();
			}

			modelCache.put("jobModel", jobModel);
		}

		return jobModel;
	}

	public SalaryModelInt getSalaryModel() {

		SalaryModelInt salaryModel = (SalaryModelInt) modelCache.get("salarymodel");
		if (salaryModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				salaryModel = new SalaryModelHibImp();
			}

			modelCache.put("salaryModel", salaryModel);
		}

		return salaryModel;
	}

	
	public InventoryModelInt getInventoryModel() {

		InventoryModelInt inventoryModel = (InventoryModelInt) modelCache.get("inventoryModel");
		if (inventoryModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				inventoryModel = new InventoryModelHibImp();
			}

			modelCache.put("inventoryModel", inventoryModel);
		}

		return inventoryModel;
	}
	public OrderModelInt getOrderModel() {

		OrderModelInt OrderModel = (OrderModelInt) modelCache.get("OrderModel");
		if (OrderModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				OrderModel = new OrderModelHibImp();
			}

			modelCache.put("OrderModel", OrderModel);
		}

		return OrderModel;
		
		
	}
	public PortfolioManagmentModelInt getPortfolioManagmentModel() {

		PortfolioManagmentModelInt PortfolioManagmentModel = (PortfolioManagmentModelInt) modelCache.get("PortfolioManagmentModel");
		if (PortfolioManagmentModel == null) {
			if ("Hibernate".equals(DATABASE)) {
				PortfolioManagmentModel = new PortfolioManagmentModelHibImp();
			}

			modelCache.put("PortfolioManagmentModel", PortfolioManagmentModel);
		}

		return PortfolioManagmentModel;
	}

	public TradeHistoryModelInt getTradeHistoryModel() {

		TradeHistoryModelInt tradehistorymodel = (TradeHistoryModelInt) modelCache.get("tradehistorymodel");
		if (tradehistorymodel == null) {
			if ("Hibernate".equals(DATABASE)) {
				tradehistorymodel = new TradeHistoryModeklHibImp();
			}

			modelCache.put("tradehistorymodel", tradehistorymodel);
		}

		return tradehistorymodel;
	}
	public FavoriteModelInt getFavoriteModel() {

		FavoriteModelInt favoritemodel = (FavoriteModelInt) modelCache.get("favoritemodel");
		if (favoritemodel == null) {
			if ("Hibernate".equals(DATABASE)) {
				favoritemodel = new FavoriteModelHibImp();
			}

			modelCache.put("favoritemodel", favoritemodel);
		}

		return favoritemodel;
		
		
	}


}
