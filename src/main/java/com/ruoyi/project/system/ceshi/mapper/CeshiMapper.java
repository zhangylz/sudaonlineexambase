package com.ruoyi.project.system.ceshi.mapper;

import com.ruoyi.project.system.ceshi.domain.Ceshi;
import java.util.List;	

/**
 * 测试格 数据层
 * 
 * @author ruoyi
 * @date 2019-03-12
 */
public interface CeshiMapper 
{
	/**
     * 查询测试格信息
     * 
     * @param id 测试格ID
     * @return 测试格信息
     */
	public Ceshi selectCeshiById(Integer id);
	
	/**
     * 查询测试格列表
     * 
     * @param ceshi 测试格信息
     * @return 测试格集合
     */
	public List<Ceshi> selectCeshiList(Ceshi ceshi);
	
	/**
     * 新增测试格
     * 
     * @param ceshi 测试格信息
     * @return 结果
     */
	public int insertCeshi(Ceshi ceshi);
	
	/**
     * 修改测试格
     * 
     * @param ceshi 测试格信息
     * @return 结果
     */
	public int updateCeshi(Ceshi ceshi);
	
	/**
     * 删除测试格
     * 
     * @param id 测试格ID
     * @return 结果
     */
	public int deleteCeshiById(Integer id);
	
	/**
     * 批量删除测试格
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteCeshiByIds(String[] ids);
	
}