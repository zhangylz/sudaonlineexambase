package com.ruoyi.project.system.tbSubject.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
                                
/**
 * 试题库表 sys_tb_subject
 *
 * @author yanleizhang
 * @date 2019-03-29
 */
public class TbSubject extends BaseEntity
        {
private static final long serialVersionUID=1L;

/**  */
@Excel(name = "题号", prompt = "题号")
private Integer subjectID;
/**  */
@Excel(name = "题目标题", prompt = "题目标题")
private String subjectTitle;
/**  */
@Excel(name = "选项A", prompt = "选项A")
private String subjectOptionA;
/**  */
@Excel(name = "选项B", prompt = "选项B")
private String subjectOptionB;
/**  */
@Excel(name = "选项C", prompt = "选项C")
private String subjectOptionC;
/**  */
@Excel(name = "选项D", prompt = "选项D")
private String subjectOptionD;
/**  */
@Excel(name = "答案", prompt = "答案")
private String subjectAnswer;
/**  */
@Excel(name = "解析", prompt = "解析")
private String subjectParse;

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
            .toString();
        }
        }
