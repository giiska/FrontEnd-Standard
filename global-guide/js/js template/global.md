<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [](#)
- [我们使用的是 artTemplate](#我们使用的是-arttemplate)
- [# 我们使用的是 artTemplate](##-我们使用的是-arttemplate)
  - [使用方法](#使用方法)
  - [语法](#语法)
  - [嵌入子模板](#嵌入子模板)
    - [test.html](#testhtml)
    - [list.html](#listhtml)
  - [不转义HTML](#不转义html)
  - [模板编码规范](#模板编码规范)
    - [不能使用 javascript 关键字作为模板变量(包括 ECMA5 严格模式下新增的关键字):](#不能使用-javascript-关键字作为模板变量包括-ecma5-严格模式下新增的关键字)
    - [模板禁止读写全局变量，所有变量全部传入或使用 helpers](#模板禁止读写全局变量，所有变量全部传入或使用-helpers)
    - [使用 `object.var` 读取对象的变量，而不是 `object['key']](#使用-objectvar-读取对象的变量，而不是-objectkey)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 我们使用的是 artTemplate
=================


## 使用方法
我们使用的是预编译模板，因此要使用 requirejs 抓取编译模板生成的 js，而不是加载源模板。

如：

```javascript
define([
  "jquery"
, 'templates/ns/card/home'
], function(
  $
, tmpCardsHome
) {
  "use strict";
  obj.$el.html( tmpCardsHome( {model: obj.model.toJSON()} ) );
}
```
  
## 语法
模板逻辑语法开始与结束的界定符号为``<%`` 与``%>``，若``<%``后面紧跟``=``号则输出变量内容。

## 嵌入子模板

``<%include(id, [data])%>``语句可以嵌入子模板，其中第二个参数是可选的，它默认传入当前的数据。

###test.html

```javascript
  <h1><%=title%></h1>
  <%include('list')%>
```
  
###list.html

```javascript
  <ul>
      <%for(i = 0; i < list.length; i ++) {%>
          <li>条目内容 <%=i + 1%> ：<%=list[i]%></li>
      <%}%>
  </ul>
```
  

## 不转义HTML

模板引擎默认数据包含的 HTML 字符进行转义以避免 XSS 漏洞，若不需要转义的地方可使用两个``=``号。

```javascript
  <%==value%>
```


## 模板编码规范

###不能使用 javascript 关键字作为模板变量(包括 ECMA5 严格模式下新增的关键字):

> break, case, catch, continue, debugger, default, delete, do, else, false, finally, for, function, if, in, instanceof, new, null, return, switch, this, throw, true, try, typeof, var, void, while, with, abstract, boolean, byte, char, class, const, double, enum, export, extends, final, float, goto, implements, import, int, interface, long, native, package, private, protected, public, short, static, super, synchronized, throws, transient, volatile, arguments, let, yield

###模板禁止读写全局变量，所有变量全部传入或使用 helpers


> artTemplate编译后的模板将运行在沙箱内，模板语句无法读写外部对象。
> 
> 在使用原生语法的引擎中，模板中若引用外部对象，随着项目复杂度增加，那时候谁都不能确定模板中的变量到底是数据还是全局对象，这种复杂的依赖关系将为会项目带来巨大的维护成本。



###使用 `object.var` 读取对象的变量，而不是 `object['key']

除非要使用动态键值读取，才可以使用 `object["keyprefix" + i]` 这样格式