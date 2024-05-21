---
title: 记一次Vue组件引发的bug
date: 2022-04-21 22:21:50
desc:
tags:
categories: vue
---

## 前言
同事分享的一个比较有意思的bug，记录下

一个封装多年的按钮组件居然出问题了。。
button 源码
```html
 <el-button v-bind="$attrs" @click="debounceClick" >
    <slot></slot>
  </el-button>

```
其实就是做了防抖处理

使用
```html
<el-form>
    <v-button type="primary" value="提交">提交</v-button>
</el-form>
```

## 现象

<form action="baidu.com" method="get" >
    <button type="primary" value="提交">提交</button>
</form>

页面跳转了，可是平时这么用都没问题。
马上想到`form表单`内的按钮有默认行为，但是我们是封装了一层，按道理`el-button`内会处理的。
可是我们发现页面源码中，提交按钮的type变成了`primary`。。理论应该是`button`，才对。
翻看`el-button`源码，发现`el-button`的type由nativeType决定，并且默认值是`button`。其实是没问题的。

然后看到了`v-bind="$attrs"`，马上想到了是样式穿透问题，传入的属性直接覆盖了原生属性。这时候是知道vue有一个配置是控制穿透的。

`inheritAttrs`
> 默认情况下父作用域的不被认作 props 的 attribute 绑定 (attribute bindings) 将会“回退”且作为普通的 HTML attribute 应用在子组件的根元素上。当撰写包裹一个目标元素或另一个组件的组件时，这可能不会总是符合预期行为。通过设置 inheritAttrs 到 false，这些默认行为将会被去掉。而通过 (同样是 2.4 新增的) 实例 property $attrs 可以让这些 attribute 生效，且可以通过 v-bind 显性的绑定到非根元素上。

> 注意：这个选项不影响 class 和 style 绑定。

然后发现封装的组件果然是忘记加了这个配置。

果然将`inheritAttrs`设置为false，取消默认行为就好了。
