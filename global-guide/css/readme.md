<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [名词解释](#名词解释)
- [要点](#要点)
- [[css 根目录] 下的 scss 目录结构](#css-根目录-下的-scss-目录结构)
- [css 规划](#css-规划)
  - [每个 APP 可参考的目录架构](#每个-app-可参考的目录架构)
- [全局工具样式类](#全局工具样式类)
  - [spaces   工具类之 margin padding 工具](#spaces---工具类之-margin-padding-工具)
    - [字母含义](#字母含义)
  - [css 细节规范](#css-细节规范)
- [scss 规范](#scss-规范)
- [列表数据排版](#列表数据排版)
- [字体图标生成](#字体图标生成)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 名词解释

  - 辅 scss 文件：以 `_` 开头的 scss 文件，如 `_spaces.scss`
  - 主 scss 文件：不以`_` 开头的 scss 文件，此类文件会被 compass compile


## 要点
 - css 框架使用 sass 版本的 bootstrap
 - css 都使用 compass compile，即 `.scss` 是源文件，`.css` 文件只由 sass compass 编译器自动生成

## [css 根目录] 下的 scss 目录结构

注意当前 [css 根目录] 下是把 scss 和 编译后的 css 存放在一起的

  - css/bs3 bootstrap，主要的 scss 组件库
  - css/common： 全局共用的组件库
    - variables   全局变量
    - mixins  全局函数
    - reset-bs3   全局对 boostrap ui 的 reset
    - reset-foundation   全局对 foundation ui 的 reset
    - reset-plugin 全局统一对各种插件重定义样式(注意不要把重定义样式写到 css/plugin 目录下，可能升级插件后丢失)
    - spaces  工具类之 margin padding 工具
    - modal  工具类之 modal 工具
    - utilities    工具类之其他
  - css/plugin 各种插件级别的 scss
  - css/apps：各 app 的页面级别的 scss
     - app1
     - app1-mobile
     - app2
     - app3
     - app4
  - css/widgets: （主 scss 文件）single plugin


## css 规划
css/common 代表全局 css
css/common/_variables.scss 全局 bootstrap 变量配置
css/common/_variables-blue.scss 全局固定蓝色系 bootstrap 变量配置，import 了 css/common/_variables.scss
css/common/_variables-black.scss 全局固定黑色系 bootstrap 变量配置，import 了 css/common/_variables.scss
css/common/_variables-gray.scss 全局固定灰色系 bootstrap 变量配置，import 了 css/common/_variables.scss

每个项目设置一份 cusomized-bootstrap，设定使用的色系，去掉不用的 bs 组件样式
每个项目设置 reset-bootstrap 的样式覆盖 bs 全局或组件样式
每个项目设置 reset-plugin 的样式覆盖插件格式
每个项目有一个或多个 css 加载入口，如 webapp.scss，这些入口引入了全局变量、函数，也包含其他全局组件样式、字体图标样式、插件样式，还有入口需要加载的项目模块样式


### 每个 APP 可参考的目录架构

  - customized-bs3.scss 自定义 bs3，@import 了 bs3 的 scss，里面包括自定义配置的 bs3 样式
  - webapp.scss 引入了全局变量、函数，也包含其他全局组件样式、字体图标样式、插件样式，@import 该 app 下各种模块样式
  - globals/       当前 app 的架构的样式，在 webapp.scss 中 @import
  - shared/          当前 app 下各模块共用部分样式，在 webapp.scss 中 @import
  - reset-bs3/     对 bs3 重写，在 webapp.scss 中 @import
  - reset-plugin/     对一些插件重写，在 webapp.scss 中 @import
  - ... 各种子模块样式目录


## 全局工具样式类

### spaces   工具类之 margin padding 工具
使用如 .m-t-10, .p-l-20 等 class 给 html 元素快速添加 padding margin 样式。
#### 字母含义
  - m   margin
  - p   padding
  - t   top
  - b   bottom
  - l   left
  - r   right

示例： ``<div class="m-t-10"></div>``


### css 细节规范
  - css 使用命名空间后，就不要再为每个选择器加前缀了，即：scss 放入子层级的样式名不要再加父级的命名前缀


```css
  .activity-container {
    .results-list {
```

而不是下面这样

```css
  .activity-container {
    .activity-results-list {
    }
  }
```

  - 颜色值不使用 ```rgb()``` 格式，要用 hex 格式，如 `#000`
  - 使用 `line-height` 时，除了 `line-height: 1` 或 `line-height: 1em` 外还要加上 `line-height: 30px`，提高兼容性
  - 字体使用要定义成变量，如在 common/_variables.scss 中有 `$font-family-yahei: Arial, "Microsoft Yahei" !default;` 的定义



## scss 规范

  - 主 scss 文件要在头部列出所有包含的辅 scss 文件（@import）、变量(@variables)、函数（@mixins），注意要严格按照此顺序
  - 辅 scss 文件的变量由主 scss 文件加载的 `_variables.scss` 存储，即辅 scss 文件不应该设置变量

## 列表数据排版
参照 [Allenice / table-like-grid.css](https://gist.github.com/Allenice/a96e5a0e467442898ca8)

## 字体图标生成
参照 [zbb / create-font-icon.md](https://github.com/zbb/front-end-skills/blob/master/create-font-icon.md)