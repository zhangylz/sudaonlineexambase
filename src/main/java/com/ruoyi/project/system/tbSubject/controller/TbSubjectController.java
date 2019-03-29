package com.ruoyi.project.system.tbSubject.controller;

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
import com.ruoyi.project.system.tbSubject.domain.TbSubject;
import com.ruoyi.project.system.tbSubject.service.ITbSubjectService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.web.multipart.MultipartFile;

/**
 * 试题库 信息操作处理
 * 
 * @author yanleizhang
 * @date 2019-03-29
 */
@Controller
@RequestMapping("/system/tbSubject")
public class TbSubjectController extends BaseController
{
    private String prefix = "system/tbSubject";
	
	@Autowired
	private ITbSubjectService tbSubjectService;
	
	@RequiresPermissions("system:tbSubject:view")
	@GetMapping()
	public String tbSubject()
	{
	    return prefix + "/tbSubject";
	}
	
	/**
	 * 查询试题库列表
	 */
	@RequiresPermissions("system:tbSubject:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(TbSubject tbSubject)
	{
		startPage();
        List<TbSubject> list = tbSubjectService.selectTbSubjectList(tbSubject);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出试题库列表
	 */
	@RequiresPermissions("system:tbSubject:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TbSubject tbSubject)
    {
    	List<TbSubject> list = tbSubjectService.selectTbSubjectList(tbSubject);
        ExcelUtil<TbSubject> util = new ExcelUtil<TbSubject>(TbSubject.class);
        return util.exportExcel(list, "tbSubject");
    }
    /**
     * 导入试题库列表
     */
    @RequiresPermissions("system:tbSubject:import")
    @PostMapping("/importData")
    @ResponseBody
    public AjaxResult importData(MultipartFile file) throws Exception
    {
        ExcelUtil<TbSubject> util = new ExcelUtil<TbSubject>(TbSubject.class);
        List<TbSubject> userList = util.importExcel(file.getInputStream());
        String message = tbSubjectService.importTbSubject(userList);
        return AjaxResult.success(message);
    }
    /**
	 * 试题库表格模板下载
	 * @return
	 */
    @RequiresPermissions("system:tbSubject:view")
    @GetMapping("/importTemplate")
    @ResponseBody
    public AjaxResult importTemplate()
    {
        ExcelUtil<TbSubject> util = new ExcelUtil<TbSubject>(TbSubject.class);
        return util.importTemplateExcel("测试表格");
    }
	
	/**
	 * 新增试题库
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存试题库
	 */
	@RequiresPermissions("system:tbSubject:add")
	@Log(title = "试题库", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(TbSubject tbSubject)
	{		
		return toAjax(tbSubjectService.insertTbSubject(tbSubject));
	}

	/**
	 * 修改试题库
	 */
	@GetMapping("/edit/{subjectID}")
	public String edit(@PathVariable("subjectID") Integer subjectID, ModelMap mmap)
	{
		TbSubject tbSubject = tbSubjectService.selectTbSubjectById(subjectID);
		mmap.put("tbSubject", tbSubject);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存试题库
	 */
	@RequiresPermissions("system:tbSubject:edit")
	@Log(title = "试题库", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(TbSubject tbSubject)
	{		
		return toAjax(tbSubjectService.updateTbSubject(tbSubject));
	}
	
	/**
	 * 删除试题库
	 */
	@RequiresPermissions("system:tbSubject:remove")
	@Log(title = "试题库", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(tbSubjectService.deleteTbSubjectByIds(ids));
	}



	
}
