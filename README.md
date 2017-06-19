# shoppingCart-JavaWebDesign
JavaWeb课程设计，使用Struts2完成购物车增、删、查、改功能
1.1【数据表】
1)	member表
NO.	  列名称	  描述
1	    mid	      保存用户的登录id
2	    password	用户密码
3	    name	    真实姓名
4	    telephone	电话
5	    zipcode	  邮政编码

2)	product表
NO.	    列名称	    描述
1	      pid	      产品编号,自动增长
2	      name	    产品简介
3	      note	    产品单价
4	      price	    产品单价
5	      amount	  产品数量
6	      count	    浏览次数
7	      num	      购买商品数量

1.2【主要业务】
1)	增加
	添加商品、增加浏览次数
添加商品：details.jsp（显示详情页）、DetailsAction.action（AddCount方法）
		  点击“加入购物车”，添加商品到购物车。
增加浏览次数：index.jsp(显示商品页)、DetailsAction.action（ShowGoods方法）
		  查看商品详情，增加浏览次数。
2)	删除
	删除商品
cart.jsp（购物车页）、CartManagerAction（DeleGoods方法）
		  点击删除，删除商品。
3)	查找
	查找商品
index.jsp(显示商品页)、ShowGoodsAction.java、PageDAO.java

4)	修改
修改商品数量
cart.jsp（购物车页）、CartManagerAction.java（ModGoods方法）
5)	分页
index.jsp(显示商品页)、ShowGoodsAction.java、PageDAO.java

6)	文件上传
userInfo.jsp(用户信息页)、UploadAction.java

7)	异步验证（Ajax）
register.jsp（注册页）、CheckUserAction.java、checkUser.js

8)	用户注册及登录
	注册：register.jsp
	登录：login.jsp

9)	过滤器
	编码过滤：CharacterFilter.java
	登录验证：LoginFilter.java

10)	监听器（在线人员统计）
onlineListener.java

11)	连接池的配置
WEB-INF/content.xml、web.xml

