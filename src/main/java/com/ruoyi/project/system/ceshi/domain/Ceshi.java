package com.ruoyi.project.system.ceshi.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.framework.web.domain.BaseEntity;

/**
 * 测试格表 ceshi
 *
 * @author ruoyi
 * @date 2019-03-12
 */
public class Ceshi extends BaseEntity
{
	private static final long serialVersionUID = 1L;

	/** ID */
	@Excel(name = "用户序号", prompt = "用户编号")
	private Integer id;
	/** 姓名 */
	@Excel(name = "用户姓名", prompt = "用户姓名")
	private String name;
	/** 密码 */
	@Excel(name = "用户密码", prompt = "用户密码")
	private String passwrod;
	/** 更新时间 */
	@Excel(name = "更新时间", prompt = "更新时间")
	private String genxin;

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
	public void setPasswrod(String passwrod)
	{
		this.passwrod = passwrod;
	}

	public String getPasswrod()
	{
		return passwrod;
	}
	public void setGenxin(String genxin)
	{
		this.genxin = genxin;
	}

	public String getGenxin()
	{
		return genxin;
	}

    @Override
	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("passwrod", getPasswrod())
            .append("genxin", getGenxin())
            .toString();
    }
}
