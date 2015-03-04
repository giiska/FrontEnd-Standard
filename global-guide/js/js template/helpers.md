<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [template helper](#template-helper)
  - [helpers document](#helpers-document)
    - [iff](#iff)
    - [$inArray](#$inarray)
    - [url](#url)
    - [i18n](#i18n)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

#template helper 

template helper 是指在 js 模板上下文中可以直接使用的函数，这些函数定义在 media/js/templates/helpers.js 中

## helpers document

### iff
IF 语句快捷方式

```javascript
template.helper('iff', function (condition, outputString) {
  return condition ? outputString : "";
});
```

示例：

```html
<div class="button <%= iff( isHightlighted, "highlighted" ) %>">
    My button
</div>
```


### $inArray
即 jquery [`$.inArray`](http://api.jquery.com/jQuery.inArray/)

```javascript
template.helper('$inArray', function (item, array) {
  return window.$.inArray(item, array);
});
```

示例：

```html
    <% if($inArray( variable, arrayVariable ) > -1, 'active') { %>
      something
    <% } %>
</script>
```

### url
ns.url 全局变量的快捷方式 

用法：在 js 中声明某个 ns.url 下某个模块的属性。
好处：不需要再传 ns 这个变量进模板

```javascript
template.helper('url', function (appNamespace, urlName) {
  return window.ns.url[appNamespace][urlName];
});
```

示例：

```javascript
ns.url.ns.reset_password = 'http://ns.cn/reset_password';
```

```html
  <!-- 输出结果 = ns.url.ns.reset_password -->
  <a href="<%=url('ns', 'reset_password')%>">重置密码</a>
</script>
```

### i18n
国际化文本字符串

```javascript
template.helper('i18n', function (tr, trPlural, pluralNum) {
  return window.i18n(tr, trPlural, pluralNum);
});
```

示例：

```html
  <!-- 无参数 -->
  <%=i18n('test')%>
</script>
```
