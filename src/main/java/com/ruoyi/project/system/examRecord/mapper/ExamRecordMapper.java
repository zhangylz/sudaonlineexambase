package com.ruoyi.project.system.examRecord.mapper;

import com.ruoyi.project.system.examRecord.domain.ExamRecord;
import java.util.List;

/**
 * 考试记录 数据层
 *
 * @author yanleizhang
 * @date 2019-04-13
 */
public interface ExamRecordMapper
{
	/**
     * 查询考试记录信息
     *
     * @param id 考试记录ID
     * @return 考试记录信息
     */
	public ExamRecord selectExamRecordById(Integer id);

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
     * 删除考试记录
     *
     * @param id 考试记录ID
     * @return 结果
     */
	public int deleteExamRecordById(Integer id);

	/**
     * 批量删除考试记录
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteExamRecordByIds(String[] ids);

}