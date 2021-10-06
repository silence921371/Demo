package com.atguigu.springmvc.handlers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

//@RequestMapping("/springmvc")
@Controller
public class helloworld {
	
	public static final String SUCCESS = "success";
	
	@RequestMapping("/helloworld")
	public String helloworld() {
		System.out.println("helloworld");
		return "success";
	}
	
	//
	@RequestMapping(value="/testMethod", method = RequestMethod.GET)
	public String testMethod() {
		System.out.println("testMethod");
		return "success";
	}
	
	//
	@RequestMapping(value="/testParamAndHeader", params= {"username", "age!=10"}, headers={"Accept-Language=zh-CN,zh;q=0.9"})
	public String testParams() {
		System.out.println("ParamAndHeader");
		return "success";
	}
	
	@RequestMapping(value="/testPathVariable/{id}")
	public String testPathVariable(@PathVariable("id") Integer id) {
		System.out.println("PathVariable ---id:"+id);
		return "success";
	}
	
	//REST
	@RequestMapping(value = "/testRest/{id}", method = RequestMethod.PUT)
	public String testRestPut(@PathVariable Integer id) {
		System.out.println("testRest Put: " + id);
		return SUCCESS;
	}

	@RequestMapping(value = "/testRest/{id}", method = RequestMethod.DELETE)
	public String testRestDelete(@PathVariable Integer id) {
		System.out.println("testRest Delete: " + id);
		return SUCCESS;
	}

	@RequestMapping(value = "/testRest", method = RequestMethod.POST)
	public String testRest() {
		System.out.println("testRest POST");
		return SUCCESS;
	}

	@RequestMapping(value = "/testRest/{id}", method = RequestMethod.GET)
	public String testRest(@PathVariable Integer id) {
		System.out.println("testRest GET: " + id);
		return SUCCESS;
	}

	@RequestMapping("/testRequestParam")
	public String testRequestParam(@RequestParam(value="name") String name, @RequestParam(value="age", required=false, defaultValue="10") Integer age) {
		System.out.println("testRequestParam: name   "+name+"    age:"+age);
		return "success";
	}
	
	@RequestMapping("/testRequestHeader")
	public String testRequestHeader(@RequestHeader(value="Accept-Language") String accetpLanguage, @RequestHeader(value="Cookie") String cookie) {
		System.out.println("testRequestHeader:   "+accetpLanguage +"   cookie:"+cookie);
		return "success";
	}
	
	@RequestMapping("/testCookieValue")
	public String testCookieValue(@CookieValue(value="JSESSIONID") String cookie) {
		System.out.println("testCookieValue:  JSESSIONID "+cookie);
		return "success";
	}
	@RequestMapping("/testMothodModelAndView")
	public ModelAndView testMothodModelAndView() {
		
		ModelAndView modelAndView = new ModelAndView("success");
		//添加模型数据到modelandview中
		modelAndView.addObject("time","2020");
		
		return modelAndView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
