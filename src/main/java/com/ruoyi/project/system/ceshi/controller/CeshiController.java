package com.ruoyi.project.system.ceshi.controller;

import java.util.List;

import com.ruoyi.project.system.user.domain.User;
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
import com.ruoyi.project.system.ceshi.domain.Ceshi;
import com.ruoyi.project.system.ceshi.service.ICeshiService;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.web.multipart.MultipartFile;

/**
 * 测试格 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-03-12
 */
@Controller
@RequestMapping("/system/ceshi")
public class CeshiController extends BaseController
{
    private String prefix = "system/ceshi";
	
	@Autowired
	private ICeshiService ceshiService;
	
	@RequiresPermissions("system:ceshi:view")
	@GetMapping()
	public String ceshi()
	{
	    return prefix + "/ceshi";
	}
	
	/**
	 * 查询测试格列表
	 */
	@RequiresPermissions("system:ceshi:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(Ceshi ceshi)
	{
		startPage();
        List<Ceshi> list = ceshiService.selectCeshiList(ceshi);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出测试格列表
	 */
	@Log(title = "测试格", businessType = BusinessType.EXPORT)
	@RequiresPermissions("system:ceshi:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Ceshi ceshi)
    {
    	List<Ceshi> list = ceshiService.selectCeshiList(ceshi);
        ExcelUtil<Ceshi> util = new ExcelUtil<Ceshi>(Ceshi.class);
        return util.exportExcel(list, "ceshi");
    }

	/**
	 * 导入测试
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@Log(title = "测试格", businessType = BusinessType.IMPORT)
	@RequiresPermissions("system:ceshi:import")
	@PostMapping("/importData")
	@ResponseBody
	public AjaxResult importData(MultipartFile file) throws Exception
	{
		ExcelUtil<Ceshi> util = new ExcelUtil<Ceshi>(Ceshi.class);
		List<Ceshi> userList = util.importExcel(file.getInputStream());
		String message = ceshiService.importCeshi(userList);
		return AjaxResult.success(message);
	}

	/**
	 * 测试表格模板下载
	 * @return
	 */
	@RequiresPermissions("system:ceshi:view")
	@GetMapping("/importTemplate")
	@ResponseBody
	public AjaxResult importTemplate()
	{
		ExcelUtil<Ceshi> util = new ExcelUtil<Ceshi>(Ceshi.class);
		return util.importTemplateExcel("测试表格");
	}
	
	/**
	 * 新增测试格
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存测试格
	 */
	@RequiresPermissions("system:ceshi:add")
	@Log(title = "测试格", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Ceshi ceshi)
	{		
		return toAjax(ceshiService.insertCeshi(ceshi));
	}

	/**
	 * 修改测试格
	 */
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Integer id, ModelMap mmap)
	{
		Ceshi ceshi = ceshiService.selectCeshiById(id);
		mmap.put("ceshi", ceshi);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存测试格
	 */
	@RequiresPermissions("system:ceshi:edit")
	@Log(title = "测试格", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Ceshi ceshi)
	{		
		return toAjax(ceshiService.updateCeshi(ceshi));
	}
	
	/**
	 * 删除测试格
	 */
	@RequiresPermissions("system:ceshi:remove")
	@Log(title = "测试格", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(ceshiService.deleteCeshiByIds(ids));
	}
	
}
