package com.ruoyi.project.system.course.service;

import java.util.List;

import com.ruoyi.common.exception.BusinessException;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.project.system.course.mapper.CourseMapper;
import com.ruoyi.project.system.course.domain.Course;
import com.ruoyi.project.system.course.service.ICourseService;
import com.ruoyi.common.utils.text.Convert;

/**
 * 课程 服务层实现
 *
 * @author yanleizhang
 * @date 2019-04-08
 */
@Service
public class CourseServiceImpl implements ICourseService {
    @Autowired
    private CourseMapper courseMapper;

    /**
     * 查询课程信息
     *
     * @param id 课程ID
     * @return 课程信息
     */
    @Override
    public Course selectCourseById(Integer id) {
        return courseMapper.selectCourseById(id);
    }

    /**
     * 查询课程列表
     *
     * @param course 课程信息
     * @return 课程集合
     */
    @Override
    public List<Course> selectCourseList(Course course) {
        return courseMapper.selectCourseList(course);
    }

    /**
     * 新增课程
     *
     * @param course 课程信息
     * @return 结果
     */
    @Override
    public int insertCourse(Course course) {
        return courseMapper.insertCourse(course);
    }

    /**
     * 修改课程
     *
     * @param course 课程信息
     * @return 结果
     */
    @Override
    public int updateCourse(Course course) {
        return courseMapper.updateCourse(course);
    }

    /**
     * 删除课程对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCourseByIds(String ids) {
        return courseMapper.deleteCourseByIds(Convert.toStrArray(ids));
    }

    /**
     * 导入课程对象
     * @param courseList
     * @return
     */

    @Override
    public String importCourse(List<Course> courseList) {
        if (StringUtils.isNull(courseList) || courseList.size() == 0) {
            throw new BusinessException("导入用户数据不能为空！");
        }
        int successNum = 0;
        StringBuilder successMsg = new StringBuilder();
        for (Course course : courseList) {
            this.insertCourse(course);
            successNum++;
        }
        successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        return successMsg.toString();
    }

}
