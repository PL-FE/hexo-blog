---
title: Hello Hexo
date: 2020-04-11 18:35:20
desc: hexo 零到个性化再到服务器
tags: 
- hexo
- blog
categories: example
---

### 前言
> 在现代化的技术下，从看上别人的板娘到博客的部署完成，不到几天一个博客就诞生啦 ！此次记录一下过程，希望可以帮助同样使用Hexo搭建博客的人！✨

#### 本博客是使用 `Hexo` 框架， 搭配 `typography` 主题来食用

[Makito](https://github.com/SumiMakito) 提供 [typography](https://github.com/SumiMakito/hexo-theme-typography)原始主题
[journey-ad](https://github.com/journey-ad) 提供 [typography](https://github.com/journey-ad/hexo-theme-typography/tree/master)二次开发主题

以下是搭建Hexo的整体步骤，思路为主🧐

1. 框架 Hexo 
2. 主题 typography 
3. 样式、脚本修改
4. 添加板娘
5. 评论 valine
6. 图片 img-box 、音乐 cplayer
7. 标签页、类别页
8. 部署
    
------------

### 框架 Hexo
`Hexo` 正如 [官网](https://hexo.io/zh-cn/)介绍，是快速、简洁且高效的博客框架

安装后使用一个命令，便可以在本地生成一个博客！🚀

Hexo 就像一个榨汁机🥃，出厂自带一个普通水果🍎（主题），支持用户自定义自己的水果🍋🍍🍑🍒🥥


Hexo 框架负责博客的操作、生成页面、部署以及支持自定义扩展等通用功能，用户自定义主题并且配置好他们的关系，Hexo便根据主题生成正确的页面


开始搭建第一个`Hello Hexo`吧！ [Hexo快速开发文档](https://hexo.io/zh-cn/docs/)

------------

### 主题 typography 

假设你已经搭建好了你的第一个博客 `Hello Hexo`，你的，接下来把主题 `typography` 下载到根目录下的文件夹`themes`，配置好Hexo和typography的关系，这里需要结合两份文档参考：[Hexo快速开发文档](https://hexo.io/zh-cn/docs/)与主题typography下的`README.md`
本博客基于[journey-ad](https://github.com/journey-ad) 提供 [typography](https://github.com/journey-ad/hexo-theme-typography/tree/master)二次开发主题
- [x] img-box
- [x] 网易云cplayer
- [x] 评论valine
- [x] 样式的二次修改

需自己动手实现

- [x] 识别QQ邮箱头像
- [x] 邮件提醒(leancloud实现)
- [x] 新增分类页、标签页

------------

### 样式、脚本修改

假设你已经完美的把Hexo&typography完美结合在一起了，接下来是基本操作，按照自己的意愿对博客的样式以及脚本进行修改，修改后需要手动主题目录下`编译打包`一下，详情移步主题下的`package.json`

HTML：[jade](http://jade-lang.com/)是一款模版引擎，`CSDN\简书\博客园`看一遍教程基本没问题

JavaScript：修改后需要在主题目录下`npm run build:webpack`

CSS：使用SCSS，修改后需要在主题目录下`npm run build:scss`

-------

### 添加板娘

假设你对修改主题文件已经得心应手

> 原本我也只是想在博客园简单拥有个板娘的，没想到意外看到这个主题，这个博客就出来了🙈

在Hexo根目录
```
npm install hexo-helper-live2d
```

安装完毕后，根据文档配置一下就🆗啦！
右下角的板娘就出现了，如果你啥也不配，右下角会默认出现`shizuku`，自带点击交互声音
![shizuku](../images/shizuku2.gif)

更多信息，参考: [hexo-helper-live2d](https://github.com/EYHN/hexo-helper-live2d/tree/405d94c61f06715f43e5370a8fc40fe13145108b)

-------

#### 评论 valine

在二次开发的主题中已经集成了 valine，只需要手动替换一个 `appId`和`appkey`即可。
识别QQ邮箱头像?  [cungudafa](https://blog.csdn.net/cungudafa/article/details/104638730/)
配置valine?  [valine官网](https://valine.js.org/)

-----

#### 图片 img-box 、音乐 cplayer

`img-box` 已经集成在样式中，无需额外的修改


[journey-ad](https://github.com/journey-ad) 已经在二次开发主题中提供了网易云接口的cplayer

{% cplayer %}
    [1356233927,1356237497,1356237499,1356233951,1356237498,1356237501,1356237500,1356233953]
{% endcplayer %}

用法：只需在标签中声明网易云音乐的ID即可
```
{% cplayer %}
    [ids]
{% endcplayer %}
```
> 音乐播放器播放列表高度有问题，最后一首歌有时会被隐藏。修改一下样式即可解决。

--------

#### 标签页、类别页
在Hexo`根目录`
```
npm install hexo-generator-category-enhance
```
Hexo根目录下的 `_config.yml`
```yml

# Generate archive page
archive_generator:
  per_page: 0

# Generate categories index page and each category page
category_generator:
  per_page: 10
  enable_index_page: true

# Generate tags index page and each tag page
tag_generator:
  per_page: 10
  enable_index_page: true
```

-------------

#### 部署
到这里你的Hexo已经基本完工了，可以选择部署到网络上，选择也有很多，github、自己的服务器等，网上也有许多教程，这里就不细说。
可以参考：[Hexo+github](https://www.cnblogs.com/fengxiongZz/p/7707219.html)、[Hexo+宝塔镜像](https://zhuanlan.zhihu.com/p/128649492)

---------------------

### END
