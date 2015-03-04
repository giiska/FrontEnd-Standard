<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [事件规范](#事件规范)
- [变量规范](#变量规范)
- [相等判断 规范](#相等判断-规范)
- [requirejs 规范](#requirejs-规范)
- [其他章节](#其他章节)
- [技巧](#技巧)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 事件规范
  - 不能在回调函数中添加事件回调

  ```javascript
  $('#side-menu').on('hover', function() {
    // 以下将导致：每个 hover 事件回调时添加一个新的 click 回调事件
    $('#side-menu-link').on('click', function() {
      // ...
    })
  })
  ```

  - 在 window, document, body 等全局共用的对象上添加事件时，请加上事件命名空间[参考 bootstrap 事件命名空间](http://getbootstrap.com/javascript/#js-data-attrs)

## 变量规范
  - 通过 jQuery 选择的 dom 对象变量要求首字符为 ``$``
  - 变量命名一律使用驼峰命名方法，除非在使用 `ajax` 方法时传入 `JSON` 格式的数据可以使用下划线。
  - 构造函数命名一律使用大写 如： 

  ```javascript
  var FeatureTip = function() {};

  // Backbone view 构造函数名
  var APP = {};
  APP.views.Service = Backbone.View.extend();
  ```


## 相等判断 规范
- ``===`` 与 ``!==`` 要求类型，值都相等。
- ``==`` 与 ``!=`` 在判断相等之前会先转换成相同的类型(如果可以的话)。因此可能会造成意想不到的情况。如:
  
```  
     0 == ''                         // true
     1 == true                    // true
     2 == true                    // false
     0 == '0'                       // true
     false == 'false'           // false
     false == '0'                 // true
     " \t\r\n " == 0              // true
```
- 所以  ``jshint`` 会提示要求使用 ``===`` 代替 ``==``(至少在判断 0,空字符串 ``''`` 的时候)。 


## requirejs 规范
 - 在 html 中加载 js 时，使用 require(['test1', 'test2']);
 - 被其他 js 中引用的 js 中要用 define，而不是 require
 - 注意所有依赖 jquery 的插件都要在 requrie.config 中 shim 语句包装一下：

   ```javascript
    , shim: {
        'backbone.relational': {
          'deps': ["underscore", "backbone"]
        }
      , 'tooltip': ['jquery']
      ...
   ```


## 其他章节

 - Backbone 规范请参考[backbone/readme.md](i18n/readme.md)
 - 前端国际化请参考[i18n/readme.md](i18n/readme.md)
 - 命名空间规范请参考[namespace-rules-and-examples.md](namespace-rules-and-examples.md)
 - 特殊排版风格请参考[style-guide.md](style-guide.md)
 - coffee 排版风格请参考[coffee script 规范](coffee/readme.md)
 - 第三方类库扩展请参考[lib-extend-guide](lib-extend-guide.md)


## 技巧

  - [js hinting](https://github.com/zbb/front-end-skills/blob/master/js-hinting.md)