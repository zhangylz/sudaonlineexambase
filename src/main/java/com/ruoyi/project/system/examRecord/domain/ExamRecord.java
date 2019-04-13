package com.ruoyi.project.system.examRecord.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;
import com.ruoyi.framework.aspectj.lang.annotation.Excel;
                    
/**
 * 考试记录表 sys_exam_record
 *
 * @author yanleizhang
 * @date 2019-04-13
 */
public class ExamRecord extends BaseEntity
        {
private static final long serialVersionUID=1L;

/** 编号 */
@Excel(name = "编号", prompt = "编号")
private Integer id;
/** 用户Id */
@Excel(name = "用户Id", prompt = "用户Id")
private Integer userId;
/** 考试Id */
@Excel(name = "考试Id", prompt = "考试Id")
private Integer examId;
/** 分数 */
@Excel(name = "分数", prompt = "分数")
private Integer score;
/** 答题记录 */
@Excel(name = "答题记录", prompt = "答题记录")
private String record;

private String userName;
private String examName;
public void setUserName(String userName)
{
        this.userName = userName;
}

public String getUserName()
{
        return this.userName;
}

public String getExamName()
{
        return this.examName;
}
public void setExamName(String exameName)
{
        this.examName = exameName;
}



public void setId(Integer id)
        {
        this.id = id;
        }

public Integer getId()
        {
        return id;
        }
public void setUserId(Integer userId)
        {
        this.userId = userId;
        }

public Integer getUserId()
        {
        return userId;
        }
public void setExamId(Integer examId)
        {
        this.examId = examId;
        }

public Integer getExamId()
        {
        return examId;
        }
public void setScore(Integer score)
        {
        this.score = score;
        }

public Integer getScore()
        {
        return score;
        }
public void setRecord(String record)
        {
        this.record = record;
        }

public String getRecord()
        {
        return record;
        }
@Override
public String toString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id",getId())
                .append("userId",getUserId())
                .append("examId",getExamId())
                .append("score",getScore())
                .append("record",getRecord())
                .append("setUserName",getUserName())
                .append("examName", getExamName())
            .toString();
        }
        }
