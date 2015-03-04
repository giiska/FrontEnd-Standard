<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [boilerplate of backbone view](#boilerplate-of-backbone-view)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

#boilerplate of backbone view

```javascript
/**
 * This is a boilerplate of backbone view, here should has view description
 *
 * @required variables or functions
 */
define([
  'jquery'
  // js 模板放到依赖列表最前面
, 'templates/app1/enterprise/wxemu-choose-preview'
, 'backbone'
, 'jquery.validate'
, 'button'
, 'popover'
, 'bootbox'
, 'wizard'
, 'alertify'
, 'app1/views/enterprise/register/enterprise-name'
, 'app1/views/enterprise/register/weixin-bind'
], function(
  $
  // js templates
, tmplChoosePreview
) {

  "use strict";

  ns.views = ns.views || {};
  // views should under module namespace
  ns.views.firstExample = Backbone.View.extend({

    // 此处的属性都将是 view 的 prototype 属性

    // 使用 view 的 prototype 的 object 类型属性要使用 copy 一份值，
    // 而不是按引用传递

    el: '#register-wizard'

  , events: {
      'click [data-action="prev"]': '_ePrev'
    , 'click [data-action="next"]': '_eNext'
    , 'click #goto-rebind': '_eGotoRebind'
    }

  , initialize: function() {
      // 统一使用 obj 作为 this 引用
      var obj = this
          // 变量的排版格式为逗号在前
        , toStep
        ;

      // 缓存 jquery 选择对象， jquery 选择对象使用 `$` 开头
      // obj.$el 下的 dom 选择都要使用 obj.$ 函数，可以去 backbone.js 看 Backbone.View.prototype
      obj.$rootwizard = obj.$('#create-menu-wizard');

      obj.enterpriseNameView = new ns.views.EnterpriseRegisterName({
        el: "#step1"
      });
      obj.enterpriseNameView.on('enterprise-name-created', function() {
        obj.$rootwizard.wizard('selectedItem', {step: 2});
      })

      obj.wxBindView = new ns.views.EnterpriseRegisterWeixinBind({
        el: $('#step2')
      });
      // 使用事件 on 和 trigger 代替回调
      obj.wxBindView.on('bind-appkey bind-account', function() {
        obj.$rootwizard.wizard('selectedItem', {step: 3});
      });

      obj._initWizardEvent();

      if(!ns.enterprise.name)
        toStep = 1;
      else if(!ns.enterprise.weixinBind) {
        toStep = 2;
        Alertify.log.error('你未完成微信账号绑定，或绑定未成功。')
      }

      obj.$rootwizard.wizard('selectedItem', {step: toStep});
    }

    // 【前缀规范】渲染 view 以 render 开头，如: `renderCreateForm`
  , renderEdit: function() {
      var obj = this;
    }
  , renderPreview: function() {
      var obj = this;
    }

    // 【前缀规范】API 调用加 api 开头
    // api 调用函数要使用 _api 开头，且只能在内部调用，如：`_apiGetEnterpriseInfo`
  , _apiGetEnterpriseInfo: function() {
      var obj = this;
    }

    // 【前缀规范】私有方法加 _ 下划线开头
    // 【前缀规范】事件回调 e 开头
    // dom event handlers
  , _ePrev: function() {
      var obj = this;
      obj.$rootwizard.wizard('previous');
    }

  , _eNext: function() {
      var obj = this;
      obj.$rootwizard.wizard('next');
    }


  , initUpload: function() {
      var obj = this
        ;

      obj.FileUpload = new ns.widgets.Upload({
        $wrapper: obj.$('[data-ns-widget="upload"]')
      });

      obj.FileUpload
          // 【事件原则】事件触发前先监听
        .on('onRendered', function(e, data) {
            obj.resetAccordionHeight(e.target)
          })
        .render()
        ;

      return obj
    }

    // 【前缀规范】私有方法加 _ 下划线开头
    // 【前缀规范】初始化其他组件、初始化特殊事件加 init 开头
    // 有一些插件有独特的事件处理方式，单独一个方法
  , _initWizardEvent: function() {
      var obj = this;

      obj.$rootwizard
        .on('stepclick', function(e, data) {
            e.preventDefault();
          })
        .on('change', function(e, data) {
          })
        .on('finished', function(e, data) {
            window.location = $('#gotoMenuList').attr('href');
          })
        ;
    }

  });

  return ns.views.firstExample;

});
```