# 创建后台管理员表
create table bg_admin(
	admin_id tinyint unsigned primary key auto_increment,
	admin_name varchar(20) not null unique key,
	admin_pass char(32) not null,
	login_ip  varchar(30) not null,
	login_nums int unsigned not null default 0,
	login_time int unsigned not null
);

-- 插入体验数据
insert into bg_admin values
	(null, 'root', md5('12345678'),'127.0.0.1',default,unix_timestamp());


# 创建分类表
create table bg_category(
	cate_id smallint unsigned primary key auto_increment,
	cate_name varchar(20) not null,
	cate_pid smallint unsigned not null, -- 父类id号
	cate_sort smallint not null, -- 分类排序
	cate_desc varchar(255) -- 分类描述
);

-- 插入体验数据
insert into bg_category values
	(1, '慢生活', 0, 1, '慢生活有益健康'),
	(2, '日记', 1, 1, '我的点点滴滴'),
	(3, '欣赏', 1, 2, '请大家随便看看'),
	(4, '程序人生', 1, 3, '程序人生很苦逼'),
	(5, '经典语录', 1, 4, '哥的经典语录'),
	(6, 'PHP课堂', 0, 2, 'PHP相关知识'),
	(7, 'HTML', 6, 1, 'web开发入门知识');


# 创建文章表
create table bg_article (
	art_id smallint unsigned primary key auto_increment,
	cate_id smallint unsigned not null comment '文章所属分类',
	title varchar(50) not null comment '文章标题',
	thumb varchar(100) not null default 'default.jpg',
	art_desc varchar(255) comment '文章描述',
	content text not null comment '文章内容',
	author varchar(20) not null comment '文章作者',
	hits smallint unsigned not null default 0 comment '点击次数',
	addtime int unsigned not null comment '添加时间',
	is_del enum('0','1') not null default '0' comment '是否删除'
);