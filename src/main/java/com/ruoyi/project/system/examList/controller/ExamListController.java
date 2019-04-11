package com.ruoyi.project.system.examList.controller;

import java.util.List;

import com.ruoyi.project.system.course.domain.Course;
import com.ruoyi.project.system.course.service.ICourseService;
import com.ruoyi.project.system.tbSubject.domain.TbSubject;
import com.ruoyi.project.system.tbSubject.service.ITbSubjectService;
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
import com.ruoyi.project.system.examList.domain.ExamList;
import com.ruoyi.project.system.examList.service.IExamListService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.web.multipart.MultipartFile;

/**
 * 考试列 信息操作处理
 * 
 * @author yanleizhang
 * @date 2019-03-30
 */
@Controller
@RequestMapping("/system/examList")
public class ExamListController extends BaseController
{
    private String prefix = "system/examList";
	
	@Autowired
	private IExamListService examListService;
	@Autowired
	private ICourseService courseService;
	@Autowired
	private ITbSubjectService tbSubjectService;
	
	@RequiresPermissions("system:examList:view")
	@GetMapping()
	public String examList()
	{
	    return prefix + "/examList";
	}
	
	/**
	 * 查询考试列列表
	 */
	@RequiresPermissions("system:examList:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(ExamList examList)
	{
		startPage();
		List<ExamList> list = examListService.selectExamListList(examList);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出考试列列表
	 */
	@RequiresPermissions("system:examList:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ExamList examList)
    {
    	List<ExamList> list = examListService.selectExamListList(examList);
        ExcelUtil<ExamList> util = new ExcelUtil<ExamList>(ExamList.class);
        return util.exportExcel(list, "examList");
    }
    /**
     * 导入考试列列表
     */
    @RequiresPermissions("system:examList:import")
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file) throws Exception
    {
        ExcelUtil<ExamList> util = new ExcelUtil<ExamList>(ExamList.class);
        List<ExamList> userList = util.importExcel(file.getInputStream());
        String message = examListService.importExamList(userList);
        return AjaxResult.success(message);
    }
    /**
	 * 考试列表格模板下载
	 * @return
	 */
    @RequiresPermissions("system:examList:view")
    @GetMapping("/importTemplate")
    @ResponseBody
    public AjaxResult importTemplate()
    {
        ExcelUtil<ExamList> util = new ExcelUtil<ExamList>(ExamList.class);
        return util.importTemplateExcel("测试表格");
    }
	
	/**
	 * 新增考试列
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存考试列
	 */
	@RequiresPermissions("system:examList:add")
	@Log(title = "考试列", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(ExamList examList)
	{
		String name = examList.getName();
		Integer courseId = Integer.valueOf(name).intValue();
		Course course = courseService.selectCourseById(courseId);
		examList.setName(course.getName());
		// random subject list.
		String questionListStr = this.randomQuestionList(courseId, 10);
		examList.setQuestions(questionListStr);
		examList.setCourseId(courseId.longValue());
		return toAjax(examListService.insertExamList(examList));
	}


	String randomQuestionList(int courseId, int maxLen) {
		TbSubject tbSubject = new TbSubject();
		tbSubject.setCourseId(courseId);
		List<TbSubject> tbList = tbSubjectService.selectTbSubjectList(tbSubject);
		String str = "";
		for (int i = 0; i < tbList.size(); i++) {
			if (i < maxLen) {
				str += tbList.get(i).getSubjectID() + "|";
			}
		}
		return str;
	}

	/**
	 * 修改考试列
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		ExamList examList = examListService.selectExamListById(id);
		mmap.put("examList", examList);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存考试列
	 */
	@RequiresPermissions("system:examList:edit")
	@Log(title = "考试列", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(ExamList examList)
	{		
		return toAjax(examListService.updateExamList(examList));
	}
	
	/**
	 * 删除考试列
	 */
	@RequiresPermissions("system:examList:remove")
	@Log(title = "考试列", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(examListService.deleteExamListByIds(ids));
	}



	
}
