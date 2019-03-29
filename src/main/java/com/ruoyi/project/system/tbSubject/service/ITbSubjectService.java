package com.ruoyi.project.system.tbSubject.service;

import com.ruoyi.project.system.tbSubject.domain.TbSubject;
import java.util.List;

/**
 * 试题库 服务层
 * 
 * @author yanleizhang
 * @date 2019-03-29
 */
public interface ITbSubjectService 
{
	/**
     * 查询试题库信息
     * 
     * @param subjectID 试题库ID
     * @return 试题库信息
     */
	public TbSubject selectTbSubjectById(Integer subjectID);
	
	/**
     * 查询试题库列表
     * 
     * @param tbSubject 试题库信息
     * @return 试题库集合
     */
	public List<TbSubject> selectTbSubjectList(TbSubject tbSubject);
	
	/**
     * 新增试题库
     * 
     * @param tbSubject 试题库信息
     * @return 结果
     */
	public int insertTbSubject(TbSubject tbSubject);
	
	/**
     * 修改试题库
     * 
     * @param tbSubject 试题库信息
     * @return 结果
     */
	public int updateTbSubject(TbSubject tbSubject);
		
	/**
     * 删除试题库信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteTbSubjectByIds(String ids);


    /**
     * 导入试题库数据
     * @param tbSubjectList
     * @return
     */
    public String importTbSubject(List<TbSubject> tbSubjectList);
}
