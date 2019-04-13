package com.ruoyi.project.system.examRecord.controller;

import java.util.List;

import com.ruoyi.common.utils.security.ShiroUtils;
import com.ruoyi.project.system.examList.domain.ExamList;
import com.ruoyi.project.system.examList.service.IExamListService;
import com.ruoyi.project.system.user.domain.User;
import com.ruoyi.project.system.user.service.IUserService;
import net.bytebuddy.asm.Advice;
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
import com.ruoyi.project.system.examRecord.domain.ExamRecord;
import com.ruoyi.project.system.examRecord.service.IExamRecordService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.web.multipart.MultipartFile;

/**
 * 考试记录 信息操作处理
 * 
 * @author yanleizhang
 * @date 2019-04-13
 */
@Controller
@RequestMapping("/system/examRecord")
public class ExamRecordController extends BaseController
{
    private String prefix = "system/examRecord";
	
	@Autowired
	private IExamRecordService examRecordService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IExamListService examListService;


	@RequiresPermissions("system:examRecord:view")
	@GetMapping()
	public String examRecord()
	{
	    return prefix + "/examRecord";
	}
	
	/**
	 * 查询考试记录列表
	 */
	@RequiresPermissions("system:examRecord:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(ExamRecord examRecord)
	{
		startPage();
		User _user = ShiroUtils.getSysUser();
		if (userService.selectUserRoleByUserId(_user.getUserId()) > 100) {
			// student
			int userId = _user.getUserId().intValue();
			examRecord.setUserId(userId);
		}
        List<ExamRecord> list = examRecordService.selectExamRecordList(examRecord);
		for(int i = 0; i <list.size(); i++) {
			int userId = list.get(i).getUserId();
			User user = userService.selectUserById(new Long(userId));
			if (user != null) {
				list.get(i).setUserName(user.getUserName());
				int examId = list.get(i).getExamId();
				ExamList examList = examListService.selectExamListById(examId);
				list.get(i).setExamName(examList.getName());
			}
		}

		return getDataTable(list);
	}
	
	
	/**
	 * 导出考试记录列表
	 */
	@RequiresPermissions("system:examRecord:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ExamRecord examRecord)
    {
    	List<ExamRecord> list = examRecordService.selectExamRecordList(examRecord);
        ExcelUtil<ExamRecord> util = new ExcelUtil<ExamRecord>(ExamRecord.class);
        return util.exportExcel(list, "examRecord");
    }
    /**
     * 导入考试记录列表
     */
    @RequiresPermissions("system:examRecord:import")
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file) throws Exception
    {
        ExcelUtil<ExamRecord> util = new ExcelUtil<ExamRecord>(ExamRecord.class);
        List<ExamRecord> userList = util.importExcel(file.getInputStream());
        String message = examRecordService.importExamRecord(userList);
        return AjaxResult.success(message);
    }
    /**
	 * 考试记录表格模板下载
	 * @return
	 */
    @RequiresPermissions("system:examRecord:view")
    @GetMapping("/importTemplate")
    @ResponseBody
    public AjaxResult importTemplate()
    {
        ExcelUtil<ExamRecord> util = new ExcelUtil<ExamRecord>(ExamRecord.class);
        return util.importTemplateExcel("测试表格");
    }
	
	/**
	 * 新增考试记录
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存考试记录
	 */
	@RequiresPermissions("system:examRecord:add")
	@Log(title = "考试记录", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(ExamRecord examRecord)
	{		
		return toAjax(examRecordService.insertExamRecord(examRecord));
	}

	/**
	 * 修改考试记录
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		ExamRecord examRecord = examRecordService.selectExamRecordById(id);
		mmap.put("examRecord", examRecord);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存考试记录
	 */
	@RequiresPermissions("system:examRecord:edit")
	@Log(title = "考试记录", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(ExamRecord examRecord)
	{		
		return toAjax(examRecordService.updateExamRecord(examRecord));
	}
	
	/**
	 * 删除考试记录
	 */
	@RequiresPermissions("system:examRecord:remove")
	@Log(title = "考试记录", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(examRecordService.deleteExamRecordByIds(ids));
	}



	
}
