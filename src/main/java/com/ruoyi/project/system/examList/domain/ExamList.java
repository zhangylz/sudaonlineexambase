package com.ruoyi.project.system.examList.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import java.util.Date;
        
/**
 * 考试列表 sys_exam_list
 *
 * @author yanleizhang
 * @date 2019-03-30
 */
public class ExamList extends BaseEntity
        {
private static final long serialVersionUID=1L;

/** 考试号 */
@Excel(name = "考试号", prompt = "考试号")
private Integer id;
/** 考试名称 */
@Excel(name = "考试名称", prompt = "考试名称")
private String name;
/** 开始时间 */
@Excel(name = "开始时间", prompt = "开始时间")
private Date startTime;
/** 截止时间 */
@Excel(name = "截止时间", prompt = "截止时间")
private Date endTIme;
/** 0:off 1:on */
@Excel(name = "0:off 1:on", prompt = "0:off 1:on")
private Long status;

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
public void setStartTime(Date startTime)
        {
        this.startTime = startTime;
        }

public Date getStartTime()
        {
        return startTime;
        }
public void setEndTIme(Date endTIme)
        {
        this.endTIme = endTIme;
        }

public Date getEndTIme()
        {
        return endTIme;
        }
public void setStatus(Long status)
        {
        this.status = status;
        }

public Long getStatus()
        {
        return status;
        }
@Override
public String toString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id",getId())
                .append("name",getName())
                .append("startTime",getStartTime())
                .append("endTIme",getEndTIme())
                .append("status",getStatus())
            .toString();
        }
        }
