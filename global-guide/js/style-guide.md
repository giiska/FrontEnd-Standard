<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [特殊排版风格](#特殊排版风格)
  - [竖排声明多个变量](#竖排声明多个变量)
  - [串连多个回调事件](#串连多个回调事件)
  - [if/else 排版格式](#ifelse-排版格式)
  - [多条件排版](#多条件排版)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 特殊排版风格

## 竖排声明多个变量

  - 声明多个变量的时候，逗号（`,`）在前面，逗号（`,`）与变量名之间一个空格，变量名要左对齐
    如：

```javascript
  var variable = xxx
    , variable2 = xxx
    , func1 = function() {
        // something
      }
    ;
```

## 串连多个回调事件

  - 批量添加回调事件排版风格如下：

```javascript
obj.view
  .on('bind-status-false', function() {
    })
    // this is a comment
  .on('bind-status-true', function() {
    })
    // another comment
  .on('login-status', function(data) {
    })
  ;
```


## if/else 排版格式

```javascript
    // if more than a day ago 60*60*24
    if(seconds >= 86400) {
       ...
    }
    // if more than an hour ago 60*60
    else if(seconds >= 3600) {
      ...
    }
    // if more than a minute ago
    else if(seconds >= 60) {
      ...
    }
    // if less than a minute ago
    else {
      ...
    }
```


## 多条件排版
  - 条件语句过长的，要每个条件一个行
  - 第二个条件的 `||` 或 `&&` 要比所在的 `if` 缩进一个层级

```javascript
  if(joinContent.name.length < 1) {
    Alertify.log.info("请输入姓名", 2000)
  }
  else if(joinContent.phone.length < 1
          || joinContent.phone.length !== 11
            // 检测是否手机号码
          || !( telReg.test(joinContent.phone) )) {
    Alertify.log.info("请正确的手机号码", 2000)
  }
  else {
  }
```
