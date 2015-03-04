<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [命名空间原则](#命名空间原则)
- [命名空间列表举例](#命名空间列表举例)
  - [global](#global)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->



# 命名空间原则

 - 只在某个应用中使用的变量或方法（即没有任何其他应用依赖它们），封装在此应用中
 - 不符合第一条原则的变量或方法，封装在 ns 命名空间下


# 命名空间列表举例

## global

ns
  - ns.util // 全局工具类函数
  - ns.config // 全局所需设置
  - ns.url // 全局所需要的 URL，以及当前 location 对象及一些扩展
      // 如：
      //  - ns.url.ns.home
      //  - ns.url.ns.home
      //  - ns.url.ns.enterprise_overview
