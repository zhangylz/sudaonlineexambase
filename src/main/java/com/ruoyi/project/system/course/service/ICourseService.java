package com.ruoyi.project.system.course.service;

import com.ruoyi.project.system.course.domain.Course;
import java.util.List;

/**
 * 课程 服务层
 * 
 * @author yanleizhang
 * @date 2019-04-08
 */
public interface ICourseService 
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
     * 删除课程信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteCourseByIds(String ids);


    /**
     * 导入课程数据
     * @param courseList
     * @return
     */
    public String importCourse(List<Course> courseList);
}
