-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('试题库', '3', '1', '/system/tbSubject', 'C', '0', 'system:tbSubject:view', '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '试题库菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('试题库查询', @parentId, '1',  '#',  'F', '0', 'system:tbSubject:list',         '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('试题库新增', @parentId, '2',  '#',  'F', '0', 'system:tbSubject:add',          '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('试题库修改', @parentId, '3',  '#',  'F', '0', 'system:tbSubject:edit',         '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('试题库删除', @parentId, '4',  '#',  'F', '0', 'system:tbSubject:remove',       '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('试题库导入', @parentId, '5',  '#',  'F', '0', 'system:tbSubject:import',       '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');

insert into sys_menu  (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('试题库导出', @parentId, '5',  '#',  'F', '0', 'system:tbSubject:export',       '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '');
