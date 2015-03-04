/**
 * “Backbone 事件”使用原则
 *
 * Note code in this file should not used directly in project
 */

define([
  './backbone-view-boilerplate'
], function() {

  // 实例化 firstExample 的对象
  var firstExampleView = new ns.views.firstExample();



  /*
  *  原则一：在 firstExampleView 的外部，不要使用其事件驱动它。
  *         应该由 firstExampleView 暴露 api 给外部使用
  * -------------------------------------------------------------------
  */

  // Good code -----------
  firstExampleView.renderEdit();

  // Bad code -----------
  firstExampleView.trigger('render-edit');



  /*
  *  原则二：事件触发前先监听
  * -------------------------------------------------------------------
  */

  // Good code -----------
  firstExampleView.on('modal-shown', function() {});
  firstExampleView.showModal();

  // Bad code -----------
  firstExampleView.showModal();
  firstExampleView.on('modal-shown', function() {});



  /*
  *  原则三：使用事件 on 和 trigger 代替多层函数
  * -------------------------------------------------------------------
  */

  // Good code -----------
  firstExampleView.on('finish-second-api', function(ret) {
    // do something ...
  })
  firstExampleView.on('finish-first-api', function(data) {
    $.post({}, function(ret) {
      firstExampleView.trigger('finish-second-api', ret);
    }, data)
  })
  $.post({}, (function(ret) {
    firstExampleView.trigger('finish-first-api', ret);
  }, data)

  // Bad code -----------
  $.post({}, (function(ret) {
    $.post({}, (function(ret) {
      // do something ...
    }, ret)
  }, data)



  /*
  *  原则四：不能在回调事件中绑定事件
  *  
  *  或者，可以使用 Backbone.Event 的 once 只绑定一次回调事件
  * -------------------------------------------------------------------
  */

  // Good code -----------

  , _renderForm: function() {
      var obj = this;
    }

    _initSomeView: function() {
      var obj = this;

      obj.SomeView = new ns.views.SomeView();
      obj.renderView = new ns.views.renderView();

      obj.renderView
        .on('rendered', function() {
            // do something
          })

      obj.SomeView
        .on('bind-status-false', function() {
            obj._renderForm({});
          })
    }
  

  // Bad code -----------

  , _renderForm: function() {
      var obj = this;

      obj.renderView
        .on('rendered', function() {
            // do something
          })

      obj.renderView.renderForm();
    }

    _initSomeView: function() {
      var obj = this;

      obj.SomeView = new ns.views.SomeView();
      obj.renderView = new ns.views.renderView();
      obj.SomeView
        .on('bind-status-false', function() {
            obj._renderForm({});
          })
    }
  

});