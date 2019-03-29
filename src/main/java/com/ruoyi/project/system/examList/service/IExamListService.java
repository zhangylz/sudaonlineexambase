package com.ruoyi.project.system.examList.service;

import com.ruoyi.project.system.examList.domain.ExamList;
import java.util.List;

/**
 * 考试列 服务层
 * 
 * @author yanleizhang
 * @date 2019-03-30
 */
public interface IExamListService 
{
	/**
     * 查询考试列信息
     * 
     * @param id 考试列ID
     * @return 考试列信息
     */
	public ExamList selectExamListById(Integer id);
	
	/**
     * 查询考试列列表
     * 
     * @param examList 考试列信息
     * @return 考试列集合
     */
	public List<ExamList> selectExamListList(ExamList examList);
	
	/**
     * 新增考试列
     * 
     * @param examList 考试列信息
     * @return 结果
     */
	public int insertExamList(ExamList examList);
	
	/**
     * 修改考试列
     * 
     * @param examList 考试列信息
     * @return 结果
     */
	public int updateExamList(ExamList examList);
		
	/**
     * 删除考试列信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteExamListByIds(String ids);


    /**
     * 导入考试列数据
     * @param examListList
     * @return
     */
    public String importExamList(List<ExamList> examListList);
}
