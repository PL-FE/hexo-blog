---
title: 纯CSS实现分栏宽度拉伸调整
date: 2022-01-21 19:35:54
desc: 使用css实现分栏拉伸效果
tags:
categories: css
---

## 前言
当写两栏分栏时，需要拖动改变宽度，马上想到了 `resize:auto` 属性，一般会出现在文本域上的，可以任意改变宽高。一般我们两栏需要拖动一般会写 js 来实现。虽然一个css属性就可以实现相同功能，但是操作起来还是有点不便。
要是  `resize:auto` 拖动点也是一条边就好了。这样就可以通过简单的 css 样式实现 js 相同的效果，以前很多效果需要使用js来实现，现在css越来越强大了，在慢慢找回自己的地位。

效果如下

 <div class="column css-resize">
        <div class="column-left">
            <div class="resize-bar"></div>
            <div class="resize-line"></div>
            <div class="resize-save">
                左侧的内容，左侧的内容，左侧的内容，左侧的内容
            </div>
        </div>
        <div class="column-right">
            右侧的内容，右侧的内容，右侧的内容，右侧的内容
        </div>
</div>

## 原理解析
其实核心就是放大 `resize:auto` 元素右下角的操作点，高度等于容器高度即可。

 <div class="column css-resize">
        <div class="column-left">
            <div class="resize-bar show-bar"></div>
            <div class="resize-line"></div>
            <div class="resize-save">
                左侧的内容，左侧的内容，左侧的内容，左侧的内容
            </div>
        </div>
        <div class="column-right">
            右侧的内容，右侧的内容，右侧的内容，右侧的内容
        </div>
</div>


左侧内容和`resize`元素是重叠的，`resize`元素是用来撑起宽度，左侧内容使用了相对父元素定位，跟随父元素宽度，而父元素由`resize`元素撑起。

## 兼容性
Chrome 完美支持拉伸，Firefox 差点意思还是只能左下角。


## 总结
1. 实现原理是 `CSS resize` 属性
2. resize 生效的条件是 overflow 不能是 visible
3. resize 在 Chrome 下其实是横纵滚动条的交汇处，改变滚动条尺寸可以改变 resize 大小
4. resize 还可以通过缩放整体容器来实现
5. resize 默认是在右下角，可以通过水平翻转到左下角，Chrome 完美支持拉伸，Firefox 不行
6. 还可以通过 direction 改变文档流的方式，将 resize 从右下角变到左下角
7. 垂直方向上 resize 只能通过 transform 翻转方式实现，因此 Firefox 体验较差
