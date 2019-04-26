package com.ruoyi.project.system.tbSubject.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
                                    
/**
 * 试题库表 sys_tb_subject
 *
 * @author yanleizhang
 * @date 2019-04-08
 */
public class TbSubject extends BaseEntity
        {
private static final long serialVersionUID=1L;

public Integer subId;
/** 题号 */
@Excel(name = "题号", prompt = "题号")
private Integer subjectID;
/** 试题标题 */
@Excel(name = "试题标题", prompt = "试题标题")
private String subjectTitle;
/** 选项A */
@Excel(name = "选项A", prompt = "选项A")
private String subjectOptionA;
/** 选项B */
@Excel(name = "选项B", prompt = "选项B")
private String subjectOptionB;
/** 选项C */
@Excel(name = "选项C", prompt = "选项C")
private String subjectOptionC;
/** 选项D */
@Excel(name = "选项D", prompt = "选项D")
private String subjectOptionD;
/** 答案 */
@Excel(name = "答案", prompt = "答案")
private String subjectAnswer;
/** 解析 */
@Excel(name = "解析", prompt = "解析")
private String subjectParse;
/** 课程ID */
@Excel(name = "课程ID", prompt = "课程ID")
private Integer courseId;

public void setSubId(Integer id) { this.subId = id;}

public  Integer getSubId() { return this.subId;}

public void setSubjectID(Integer subjectID)
        {
        this.subjectID = subjectID;
        }

public Integer getSubjectID()
        {
        return subjectID;
        }
public void setSubjectTitle(String subjectTitle)
        {
        this.subjectTitle = subjectTitle;
        }

public String getSubjectTitle()
        {
        return subjectTitle;
        }
public void setSubjectOptionA(String subjectOptionA)
        {
        this.subjectOptionA = subjectOptionA;
        }

public String getSubjectOptionA()
        {
        return subjectOptionA;
        }
public void setSubjectOptionB(String subjectOptionB)
        {
        this.subjectOptionB = subjectOptionB;
        }

public String getSubjectOptionB()
        {
        return subjectOptionB;
        }
public void setSubjectOptionC(String subjectOptionC)
        {
        this.subjectOptionC = subjectOptionC;
        }

public String getSubjectOptionC()
        {
        return subjectOptionC;
        }
public void setSubjectOptionD(String subjectOptionD)
        {
        this.subjectOptionD = subjectOptionD;
        }

public String getSubjectOptionD()
        {
        return subjectOptionD;
        }
public void setSubjectAnswer(String subjectAnswer)
        {
        this.subjectAnswer = subjectAnswer;
        }

public String getSubjectAnswer()
        {
        return subjectAnswer;
        }
public void setSubjectParse(String subjectParse)
        {
        this.subjectParse = subjectParse;
        }

public String getSubjectParse()
        {
        return subjectParse;
        }
public void setCourseId(Integer courseId)
        {
        this.courseId = courseId;
        }

public Integer getCourseId()
        {
        return courseId;
        }
@Override
public String toString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("subjectID",getSubjectID())
                .append("subjectTitle",getSubjectTitle())
                .append("subjectOptionA",getSubjectOptionA())
                .append("subjectOptionB",getSubjectOptionB())
                .append("subjectOptionC",getSubjectOptionC())
                .append("subjectOptionD",getSubjectOptionD())
                .append("subjectAnswer",getSubjectAnswer())
                .append("subjectParse",getSubjectParse())
                .append("courseId",getCourseId())
            .toString();
        }
        }
