package com.ruoyi.project.system.examRecord.service;

import com.ruoyi.project.system.examRecord.domain.ExamRecord;
import java.util.List;

/**
 * 考试记录 服务层
 * 
 * @author yanleizhang
 * @date 2019-04-13
 */
public interface IExamRecordService 
{
	/**
     * 查询考试记录信息
     * 
     * @param id 考试记录ID
     * @return 考试记录信息
     */
	public ExamRecord selectExamRecordById(Integer id);
	public ExamRecord selectExamRecordByUserId(Integer id);
	/**
     * 查询考试记录列表
     * 
     * @param examRecord 考试记录信息
     * @return 考试记录集合
     */
	public List<ExamRecord> selectExamRecordList(ExamRecord examRecord);
	
	/**
     * 新增考试记录
     * 
     * @param examRecord 考试记录信息
     * @return 结果
     */
	public int insertExamRecord(ExamRecord examRecord);
	
	/**
     * 修改考试记录
     * 
     * @param examRecord 考试记录信息
     * @return 结果
     */
	public int updateExamRecord(ExamRecord examRecord);
		
	/**
     * 删除考试记录信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteExamRecordByIds(String ids);


    /**
     * 导入考试记录数据
     * @param examRecordList
     * @return
     */
    public String importExamRecord(List<ExamRecord> examRecordList);
}
