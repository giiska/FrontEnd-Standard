<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [命名规范](#命名规范)
- [html 格式](#html-格式)
- [DOM 元素(js 选择器)](#dom-元素js-选择器)
- [图标规范](#图标规范)
  - [字体图标](#字体图标)
  - [排版规范](#排版规范)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 命名规范

 - 只能使用全拼或英文单词加数字命名，不能使用拼音首字母拼接来命名，如可以使用 caiyun、galaxyS4，不能使用 cy、gS4
 - dom 命名是不能使用 ``ad`` 命名，会被 adblock 等浏览器插件当成广告屏蔽


## html 格式
 * ``<a>``标签预留 href 链接占位符使用``javascript:void(0);``
 * 所有标签需要符合 XHTML 标准闭合 ``<br />`` ``<hr />`` ``<img />`` 等标签注意以斜杠结尾，注意其中的空格
 * 避免使用style="xxx:xxx;"的内联样式表，可以在 html 中使用<style type="text/css"></style>加入
 * HTML[符号使用参考HTML](http://www.w3school.com.cn/tags/html_ref_entities.html)符号实体
 * ``<a>`` 标签添加外链时使用 ``rel="external"`` 请参考以下代码

   ```
    // 外接添加 _blank
    $("a[href*='http://']:not([href*='" + location.hostname + "']),
       [href*='https://']:not([href*='" + location.hostname + "']),
       a[rel='external'],
       a[rel='external nofollow']").attr("target", "_blank");
   ```

## DOM 元素(js 选择器)

   - DOM 元素的 id 属性预留给 js 使用，请勿用于 css
   - DOM 元素的 class 属性预留给 css 使用，请勿用于 js
   - DOM 元素的 class 属性命名时，使用 - 小横杠分隔单词，请勿使用 _ 下划线或驼峰命名法
   - JS 批量操作 DOM 元素请给元素添加属性 ``data-xxx`` 作为选择器，操作使用 ``data-action="delete"`` 或 ``data-action="edit"`` 等，渲染视图使用 ``data-el="item"`` 或 ``data-el="tag"`` 等类似。

   - JS 操作DOM元素的 ``data-*`` 属性时，使用 ``.attr("data-xxx")`` ，不要使用 ``.data("xxx")``,后者会把string、number类型的属性转化。而且浏览器支持不全面。

## 图标规范


### 字体图标
优先使用 font icon 和 fontawesome font icon

### 排版规范

图标与其前面或后面的说明文字之间间隔一个空格

错误的：

```
<i class="icon-lightning"></i><span>常用任务</span>
```
正确的：

```
<i class="icon-lightning"></i><span> 常用任务</span>
```
