<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [Backbone 类规范](#backbone-类规范)
  - [backbone 应用程序设计模式](#backbone-应用程序设计模式)
    - [v m c 对象化](#v-m-c-对象化)
    - [对象化具体内容](#对象化具体内容)
  - [类、实例命名及命名空间](#类、实例命名及命名空间)
  - [类属性](#类属性)
  - [常用方法名](#常用方法名)
  - [保留方法名](#保留方法名)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Backbone 类规范
*View（简称 v）, Model（简称 m）, Collection（简称 c） 

## backbone 应用程序设计模式
基本思路：基于事件回调响应的松耦合架构

### v m c 对象化
只知道自己负责的东西即可，职责最小化，这样做可以把大东西拆分成各种小东西。

### 对象化具体内容
  - 暴露接口：规定外部对象如何调用内部功能
  - 监听事件：监听传进来外部通知
  - 发布通知：通知外部对象（外部对象指实例化本对象或监听本对象的对象）
  - 回调方法：监听事件的回调或DOM 事件的回调（DOM 事件为 view 特有）

## 类、实例命名及命名空间
  - 类都要放到相应 app 的命名空间下，如 `ns.views`, `ns.models`
  - 类名首字母要大写，如 `ns.models.SideMenu`，避免在类名中使用 'view', 'model', 'collection' 等关键词
  - 类实例需要加上 'view', 'model', 'collection' 等后缀明确指出是何种类实例

## 类属性
  - 对象中的属性（变量）要放到对象的方法前面
  - 对象中的方法要依照“命名前缀”命名
    + 对象中的内部事件要以 `_` 开头
    + 对象中的回调事件函数使用 _e 开头，如 `_ePrev`
    + 对象中的渲染函数使用 render 开头，只在内部调用的渲染函数用 `_render` 开头

## 常用方法名
  - `_addOne` 在 list view 中回调 collection 的 `add` 事件
  - `_addAll` 在 list view 中回调 collection 的 `all` 事件
  - `_cacheDom` 缓存 dom 对象
  - `_setUiDefaults` 设置 dom 中的默认值
  - `_bindValide` 绑定表单验证事件
  - `_submitForm` 提交表单

## 保留方法名
以下保留方法名是全局扩展第三方类库或构建全局 mixin 组件的方法名，**不能在业务逻辑中 override**

  - showModal 全局 modal mixin 组件的方法
  - hideModal 全局 modal mixin 组件的方法
  - closeModal 全局 modal mixin 组件的方法
  
# extend backbone
由于 backbone 的局限性，我们使用了 'js/apps/common/extend/backbone.js' 对其进行了扩展
  - [set computed attributes by defaults](https://gist.github.com/bammoo/d8b09252e4cfa081d0e6#set-computed-attributes-by-defaults)