package com.ruoyi.project.system.course.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
        
/**
 * 课程表 sys_course
 *
 * @author yanleizhang
 * @date 2019-04-08
 */
public class Course extends BaseEntity
        {
private static final long serialVersionUID=1L;

/** 课程号 */
@Excel(name = "课程号", prompt = "课程号")
private Integer id;
/** 课程名 */
@Excel(name = "课程名", prompt = "课程名")
private String name;

public void setId(Integer id)
        {
        this.id = id;
        }

public Integer getId()
        {
        return id;
        }
public void setName(String name)
        {
        this.name = name;
        }

public String getName()
        {
        return name;
        }
@Override
public String toString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id",getId())
                .append("name",getName())
            .toString();
        }
        }
