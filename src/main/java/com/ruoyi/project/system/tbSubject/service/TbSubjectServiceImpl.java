package com.ruoyi.project.system.tbSubject.service;

import java.util.List;

import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.tbSubject.mapper.TbSubjectMapper;
import com.ruoyi.project.system.tbSubject.domain.TbSubject;
import com.ruoyi.project.system.tbSubject.service.ITbSubjectService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 试题库 服务层实现
 *
 * @author yanleizhang
 * @date 2019-03-29
 */
@Service
public class TbSubjectServiceImpl implements ITbSubjectService {
    @Autowired
    private TbSubjectMapper tbSubjectMapper;

    /**
     * 查询试题库信息
     *
     * @param subjectID 试题库ID
     * @return 试题库信息
     */
    @Override
    public TbSubject selectTbSubjectById(Integer subjectID) {
        return tbSubjectMapper.selectTbSubjectById(subjectID);
    }

    /**
     * 查询试题库列表
     *
     * @param tbSubject 试题库信息
     * @return 试题库集合
     */
    @Override
    public List<TbSubject> selectTbSubjectList(TbSubject tbSubject) {
        return tbSubjectMapper.selectTbSubjectList(tbSubject);
    }

    /**
     * 新增试题库
     *
     * @param tbSubject 试题库信息
     * @return 结果
     */
    @Override
    public int insertTbSubject(TbSubject tbSubject) {
        return tbSubjectMapper.insertTbSubject(tbSubject);
    }

    /**
     * 修改试题库
     *
     * @param tbSubject 试题库信息
     * @return 结果
     */
    @Override
    public int updateTbSubject(TbSubject tbSubject) {
        return tbSubjectMapper.updateTbSubject(tbSubject);
    }

    /**
     * 删除试题库对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTbSubjectByIds(String ids) {
        return tbSubjectMapper.deleteTbSubjectByIds(Convert.toStrArray(ids));
    }

    /**
     * 导入试题库对象
     * @param tbSubjectList
     * @return
     */

    @Override
    public String importTbSubject(List<TbSubject> tbSubjectList) {
        if (StringUtils.isNull(tbSubjectList) || tbSubjectList.size() == 0) {
            throw new BusinessException("导入用户数据不能为空！");
        }
        int successNum = 0;
        StringBuilder successMsg = new StringBuilder();
        for (TbSubject tbSubject : tbSubjectList) {
            this.insertTbSubject(tbSubject);
            successNum++;
        }
        successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        return successMsg.toString();
    }

}
