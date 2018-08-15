package hibernate.controller;

import java.util.List;

import hibernate.domain.Manager;
import hibernate.domain.Report;
import hibernate.domain.Student;
import hibernate.service.ManagerServiceImpl;
import hibernate.service.ReportServiceImpl;
import hibernate.service.StudentServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


@Controller
@RequestMapping
public class StudentController {

	@Autowired
	private StudentServiceImpl studentService;
	
	@Autowired
	private ManagerServiceImpl managerService;
	
	@Autowired
	private ReportServiceImpl reportService;
	
	@RequestMapping(value ="/studentlist" , method = RequestMethod.GET)
	public String defaultView(Model model) throws JsonProcessingException{
		List<Student> studentsList = studentService.getAllStudents(); 		
		model.addAttribute("studentsList",studentsList);
		return "deneme";
	}
	
	@RequestMapping(value = "/studentReport", method = RequestMethod.GET)
	public String getPersonList(Model model) {
		return "report";
	}
	
	
	 
	    @RequestMapping(value = "/addStudent" , method = RequestMethod.POST)
	    @ResponseBody
	    public String addStudent(@RequestBody Student student) {
	        
	        studentService.insertStudent(student);
	        
	        return "redirect:/studentlist";
	    }
	    
	    @RequestMapping(value = "/addReport" , method = RequestMethod.POST)
	    @ResponseBody
	    public String addReport(@RequestBody Report report) {
	        System.out.println("addReport RUN !");
	        reportService.insertReport(report);
	        
	        return "redirect:/studentlist";
	    }   	    
	    
	   
	    
	    @RequestMapping(value = "/updateStudent" , method = RequestMethod.PUT)
	    @ResponseBody
	    public String updateStudent(@RequestBody Student student) {
	        studentService.updateStudent(student);
	        return "{\"status\":\"Success\"}";
	    }
	    
	    @RequestMapping(value = "/deleteStudent" , method = RequestMethod.DELETE)
	    @ResponseBody
	    public void deleteStudent(@RequestBody String studentNumber) {
	    	
	        studentService.deleteStudent(Integer.parseInt(studentNumber));
	    }
	    
	    @RequestMapping(value = "/reportStudent{studentNumber}",method = RequestMethod.GET)	   
	    public String reportStudent(@RequestParam("studentNumber") String studentNumber,Model model){	    	
	    	
	    	String managerName = studentService.getManagernameById(Integer.parseInt(studentNumber));	    	
	    	model.addAttribute("studentNumber", studentNumber);
	    	model.addAttribute("managerName",managerName);  	
	    	
	    	return "StudentRapor";
	    }
	    
	    
	    @ModelAttribute("managerList")
	    public List<Manager> getAllManager(){
	    	return managerService.getAllManagers();
	    }
	
}
