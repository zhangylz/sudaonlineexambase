package com.ruoyi.project.system.examList.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import com.ruoyi.project.system.tbSubject.domain.TbSubject;
import com.ruoyi.project.system.user.domain.User;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * 考试列表 sys_exam_list
 *
 * @author yanleizhang
 * @date 2019-03-30
 */
public class PaperInfo extends BaseEntity {

        public List<TbSubject> listSubject;
        public String  paperName;
        User user;
        Integer paperId;

        public void setPaperId(Integer id)
        {
        this.paperId = id;
        }
        public  Integer getPaperId() { return this.paperId;}
        public User getUser() { return this.user;}
        public void setUser(User user) { this.user = user;}
        public String getPaperName() { return this.paperName;}
        public void setPaperName(String name) { this.paperName = name;}
        public void setSubjectList(List<TbSubject> listSubject) { this.listSubject = listSubject;}
        public List<TbSubject> getListSubject() { return this.listSubject;}

}
