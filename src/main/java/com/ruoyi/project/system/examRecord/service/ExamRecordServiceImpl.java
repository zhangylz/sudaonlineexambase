package com.ruoyi.project.system.examRecord.service;

import java.util.List;

import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.examRecord.mapper.ExamRecordMapper;
import com.ruoyi.project.system.examRecord.domain.ExamRecord;
import com.ruoyi.project.system.examRecord.service.IExamRecordService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 考试记录 服务层实现
 *
 * @author yanleizhang
 * @date 2019-04-13
 */
@Service
public class ExamRecordServiceImpl implements IExamRecordService {
    @Autowired
    private ExamRecordMapper examRecordMapper;

    /**
     * 查询考试记录信息
     *
     * @param id 考试记录ID
     * @return 考试记录信息
     */
    @Override
    public ExamRecord selectExamRecordById(Integer id) {
        return examRecordMapper.selectExamRecordById(id);
    }

    /**
     * 查询考试记录列表
     *
     * @param examRecord 考试记录信息
     * @return 考试记录集合
     */
    @Override
    public List<ExamRecord> selectExamRecordList(ExamRecord examRecord) {
        return examRecordMapper.selectExamRecordList(examRecord);
    }

    /**
     * 新增考试记录
     *
     * @param examRecord 考试记录信息
     * @return 结果
     */
    @Override
    public int insertExamRecord(ExamRecord examRecord) {
        return examRecordMapper.insertExamRecord(examRecord);
    }

    /**
     * 修改考试记录
     *
     * @param examRecord 考试记录信息
     * @return 结果
     */
    @Override
    public int updateExamRecord(ExamRecord examRecord) {
        return examRecordMapper.updateExamRecord(examRecord);
    }

    /**
     * 删除考试记录对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteExamRecordByIds(String ids) {
        return examRecordMapper.deleteExamRecordByIds(Convert.toStrArray(ids));
    }

    /**
     * 导入考试记录对象
     * @param examRecordList
     * @return
     */

    @Override
    public String importExamRecord(List<ExamRecord> examRecordList) {
        if (StringUtils.isNull(examRecordList) || examRecordList.size() == 0) {
            throw new BusinessException("导入用户数据不能为空！");
        }
        int successNum = 0;
        StringBuilder successMsg = new StringBuilder();
        for (ExamRecord examRecord : examRecordList) {
            this.insertExamRecord(examRecord);
            successNum++;
        }
        successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        return successMsg.toString();
    }

}
