package com.ruoyi.project.system.examList.service;

import java.util.List;

import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.examList.mapper.ExamListMapper;
import com.ruoyi.project.system.examList.domain.ExamList;
import com.ruoyi.project.system.examList.service.IExamListService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 考试列 服务层实现
 *
 * @author yanleizhang
 * @date 2019-03-30
 */
@Service
public class ExamListServiceImpl implements IExamListService {
    @Autowired
    private ExamListMapper examListMapper;

    /**
     * 查询考试列信息
     *
     * @param id 考试列ID
     * @return 考试列信息
     */
    @Override
    public ExamList selectExamListById(Integer id) {
        return examListMapper.selectExamListById(id);
    }

    /**
     * 查询考试列列表
     *
     * @param examList 考试列信息
     * @return 考试列集合
     */
    @Override
    public List<ExamList> selectExamListList(ExamList examList) {
        return examListMapper.selectExamListList(examList);
    }

    /**
     * 新增考试列
     *
     * @param examList 考试列信息
     * @return 结果
     */
    @Override
    public int insertExamList(ExamList examList) {
        return examListMapper.insertExamList(examList);
    }

    /**
     * 修改考试列
     *
     * @param examList 考试列信息
     * @return 结果
     */
    @Override
    public int updateExamList(ExamList examList) {
        return examListMapper.updateExamList(examList);
    }

    /**
     * 删除考试列对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteExamListByIds(String ids) {
        return examListMapper.deleteExamListByIds(Convert.toStrArray(ids));
    }

    /**
     * 导入考试列对象
     * @param examListList
     * @return
     */

    @Override
    public String importExamList(List<ExamList> examListList) {
        if (StringUtils.isNull(examListList) || examListList.size() == 0) {
            throw new BusinessException("导入用户数据不能为空！");
        }
        int successNum = 0;
        StringBuilder successMsg = new StringBuilder();
        for (ExamList examList : examListList) {
            this.insertExamList(examList);
            successNum++;
        }
        successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        return successMsg.toString();
    }

}
