package com.ruoyi.project.system.course.mapper;

import com.ruoyi.project.system.course.domain.Course;
import java.util.List;

/**
 * 课程 数据层
 *
 * @author yanleizhang
 * @date 2019-04-08
 */
public interface CourseMapper
{
	/**
     * 查询课程信息
     *
     * @param id 课程ID
     * @return 课程信息
     */
	public Course selectCourseById(Integer id);

	/**
     * 查询课程列表
     *
     * @param course 课程信息
     * @return 课程集合
     */
	public List<Course> selectCourseList(Course course);

	/**
     * 新增课程
     *
     * @param course 课程信息
     * @return 结果
     */
	public int insertCourse(Course course);

	/**
     * 修改课程
     *
     * @param course 课程信息
     * @return 结果
     */
	public int updateCourse(Course course);

	/**
     * 删除课程
     *
     * @param id 课程ID
     * @return 结果
     */
	public int deleteCourseById(Integer id);

	/**
     * 批量删除课程
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteCourseByIds(String[] ids);

}