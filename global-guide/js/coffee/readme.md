<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [coffeescript 规范](#coffeescript-规范)
  - [定义一个 backbone 模块](#定义一个-backbone-模块)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# coffeescript 规范

## 定义一个 backbone 模块
``` javascript
    define [
      'jquery'
      'underscore'
      'backbone'
    ], ($, _, Backbone)->
      'use strict'
      console.log $
``` 

完整 backbone 模块例子参考[coffee-guide-example.coffee](coffee-guide-example.coffee)