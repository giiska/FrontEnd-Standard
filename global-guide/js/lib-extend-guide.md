<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [类库扩展机制](#类库扩展机制)
  - [机制](#机制)
  - [扩展方法](#扩展方法)
  - [示例](#示例)
    - [在全局范围扩展某个类库](#在全局范围扩展某个类库)
    - [在某个应用范围内扩展某个类库](#在某个应用范围内扩展某个类库)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# 类库扩展机制

## 机制
使用 require 来管理扩展的层次性，保证下层的会覆盖上层的扩展。
如在下层应用中使用 `ns/extend/backbone.js` 覆盖顶层的 `common/extend/backbone.js` 对 backbone 的扩展。

## 扩展方法

  - assign or rewrite `Backbone.mixin = function (view, mixin, custom) {}`
  - extend prototype `_.extend(Backbone.View.prototype, {})`

## 示例

### 在全局范围扩展某个类库
如扩展 backbone
建立 common/extend/backbone.js
代码如下：

```javascript
define(['backbone'], function () {
  "use strict";

  Backbone.mixin = function (view, mixin, custom) {}

  return Backbone
});
```

使用时：

```javascript
define(['common/extend/backbone'], function () {
  "use strict";
});
```

*注意 `common/extend/backbone` 可以简写成 `common/extend/backbone`


### 在某个应用范围内扩展某个类库

建立 ns/extend/backbone.js
代码如下：

```javascript
// 由于在全局范围有 common/extend/backbone，所以此处要加载全局的 extend
define(['common/extend/backbone'], function () {
  "use strict";

  return Backbone
});
```

使用时：

```javascript
define(['ns/extend/backbone'], function () {
  "use strict";
});
```
