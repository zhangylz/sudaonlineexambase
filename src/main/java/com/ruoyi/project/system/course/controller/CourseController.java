package com.ruoyi.project.system.course.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.project.system.course.domain.Course;
import com.ruoyi.project.system.course.service.ICourseService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.web.multipart.MultipartFile;

/**
 * 课程 信息操作处理
 * 
 * @author yanleizhang
 * @date 2019-04-08
 */
@Controller
@RequestMapping("/system/course")
public class CourseController extends BaseController
{
    private String prefix = "system/course";
	
	@Autowired
	private ICourseService courseService;
	
	@RequiresPermissions("system:course:view")
	@GetMapping()
	public String course()
	{
	    return prefix + "/course";
	}
	
	/**
	 * 查询课程列表
	 */
	@RequiresPermissions("system:course:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Course course)
	{
		startPage();
        List<Course> list = courseService.selectCourseList(course);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出课程列表
	 */
	@RequiresPermissions("system:course:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Course course)
    {
    	List<Course> list = courseService.selectCourseList(course);
        ExcelUtil<Course> util = new ExcelUtil<Course>(Course.class);
        return util.exportExcel(list, "course");
    }
    /**
     * 导入课程列表
     */
    @RequiresPermissions("system:course:import")
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file) throws Exception
    {
        ExcelUtil<Course> util = new ExcelUtil<Course>(Course.class);
        List<Course> userList = util.importExcel(file.getInputStream());
        String message = courseService.importCourse(userList);
        return AjaxResult.success(message);
    }
    /**
	 * 课程表格模板下载
	 * @return
	 */
    @RequiresPermissions("system:course:view")
    @GetMapping("/importTemplate")
    @ResponseBody
    public AjaxResult importTemplate()
    {
        ExcelUtil<Course> util = new ExcelUtil<Course>(Course.class);
        return util.importTemplateExcel("测试表格");
    }
	
	/**
	 * 新增课程
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存课程
	 */
	@RequiresPermissions("system:course:add")
	@Log(title = "课程", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Course course)
	{		
		return toAjax(courseService.insertCourse(course));
	}

	/**
	 * 修改课程
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		Course course = courseService.selectCourseById(id);
		mmap.put("course", course);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存课程
	 */
	@RequiresPermissions("system:course:edit")
	@Log(title = "课程", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Course course)
	{		
		return toAjax(courseService.updateCourse(course));
	}
	
	/**
	 * 删除课程
	 */
	@RequiresPermissions("system:course:remove")
	@Log(title = "课程", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(courseService.deleteCourseByIds(ids));
	}



	
}
