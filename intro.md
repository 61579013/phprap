[PHPRAP，是一个PHP轻量级开源API接口文档管理系统，致力于减少前后端沟通成本，提高团队协作开发效率，打造PHP版的RAP。](http://phprap.gouguoyin.cn)
## 更新记录

 - 修复在nginx服务器下报错的BUG
 - 修复PHP7版无法获取mysql版本号造成无法安装的BUG
 - 核心类增加mock服务类
 - 接口返回示例由手动填写优化为通过MOCK规则自动生成
 - 支持添加、修改字段后时时显示返回格式化的json示例
 - 接口提供mock请求地址，方便后端在接口还未开发完成时，前端可以暂时调用mock地址开发
 
## 特性

### 部署简单
> 提供傻瓜式在线安装程序，按照安装步骤，只需填写少量信息即可快速完成安装部署，开箱即用

 - 安装步骤一：环境检测
 - 安装步骤二：数据库配置
 - 安装步骤三：管理员配置
 - 安装步骤四：安装完成

### 操作简单
> 基于bootstrap搭建，完美适配PC和移动端，和淘宝RAP高度一致的操作流程，给力的用户体验，让你一分钟上手

 - 搜索项目、加入项目、退出项目、添加项目、编辑项目、删除项目、转让项目、导出项目、项目成员、项目动态
 - 添加环境、编辑环境、删除环境
 - 添加模块、编辑模块、删除模块
 - 添加接口、编辑接口、删除接口
 - 添加字段、编辑字段、删除字段
 - 申请管理、登录历史

### MOCK服务
> 根据接口文档自动生成模拟数据，让前端在脱离后端的情况下独立进行开发测试，提高团队协作开发效率

 - 支持请求协议、请求方式和请求参数格式校验;
 - 根据接口文档自动生成模拟数据，支持复杂的生成逻辑;
 - 通过随机数据，模拟各种场景，增加单元测试的真实性;
 - 支持在线对API进行测试并保存测试数据，提高接口测试效率；
 - 数据类型丰富，支持生成随机的文本、数字、布尔值、日期、邮箱、链接、图片、颜色等;

### 后台管理
> 只有管理员才可以在右上角下拉菜单看到管理中心选项
  
 - 管理主页：数据统计、系统信息
 - 项目管理：转让、删除、查看
 - 成员管理：冻结用户、重置密码
 - 数据备份：备份、还原、删除
 - 登录历史、系统设置

### 在线测试
> 支持在线对API进行测试并保存测试数据，提供接口测试效率，再也不用来回调试接口

### 权限控制
> 完善的权限控制系统，可以分别控制项目的编辑、删除、转让权限和模块接口的添加、编辑、删除权限

### 一键导出
> 支持postman，rap，swagger的导入，方便你做无缝迁移，同时也支持html文件的导出，方便你离线浏览

## 依赖

 - PHP >= 5.5.0
 - PDO 拓展
 - GD 拓展
 - CURL 拓展
 - MCRYPT 拓展
 
## 安装

- 下载程序

  [**GITHUB**]
    ```php
    git clone https://github.com/gouguoyin/phprap.git -b 'stable'
    ```
    
  [**GITEE**]
    ```php
    git clone https://gitee.com/gouguoyin/phprap.git -b 'stable'
    ```
    
  [**源码**]
  
  下载[源码](https://github.com/gouguoyin/phprap/archive/stable.zip)，上传到服务器上后解压

## 联系

- 如果您在使用过程中有任何疑问，或有好的意见和想法，请通过以下途径联系我或者新建 [Issue](https://github.com/gouguoyin/phprap/issues)  讨论新特性或者变更。
- 官方网站：[phprap.gouguoyin.cn](http://phprap.gouguoyin.cn)
- 演示网站：[apidoc.gouguoyin.cn](http://apidoc.gouguoyin.cn)
- 作者博客：[www.gouguoyin.cn](http://www.gouguoyin.cn/about.html)
- 官方QQ群：421537504 <a style="margin-left:10px" target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=d49826b55d1759513ce5d68253b3f0589b227587edf87059aa08125e620b73c0"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="GoPHP官方交流群" title="GoPHP官方交流群"></a>
