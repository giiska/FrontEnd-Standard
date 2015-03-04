# example link: /js/apps/app1/modules/module1/views/manage.js
# guide link: ./coffeescript-guide.md

###
  注意：调用此视图必传入两个参数
     {
       page_size: 3, 每页显示的条目数量
       hideFilter: true 是否隐藏过滤，例如选择表单类型和搜索等等 true: show false: not show
     }
###

define [
  'jquery'
  'tmpl/manage'
  'extend/marionette'
  'common/views/pager'
  'module1/models/form-item'
  'module1/views/form-item'
  'alertify'
  'common/views/mixins/loading'
], (
  $
  tmpl
) ->
  'use strict'

  Module1.views = Module1.views || {}

  Module1.views.ManageModule1 = Marionette.ItemView.extend {

    viewName: 'Module1-manage'

    pagerEl: '#pager-wrapper'

    className: 'manage-form'

    formType: [
      {
        type: 'poll'
        typeText: '投票调查'
      }
      {
        type:'activity'
        typeText: '组织活动'
      }
      {
        type:'merchandise'
        typeText: '推荐商品'
      }
      {
        type:'all'
        typeText: '所有'
      }
    ]

    ui: {
      formTypeZone: '#form-type-zone'
      keywordSearch: '#keyword-search'
      # 表单列表
      formUl: '#form-ul'
      formItem: '#form-item'
      totalCount: '#total-count'
    }

    events: {
      'click [data-action="search"]': '_eClickSearch'
      'keydown @ui.keywordSearch': '_eKeySearch'
      'click #form-type-zone li a': '_eGetFormType'
    }

    initialize: (options)->
      obj = this;

      obj.itemsPerPage = options.page_size;

      obj._setFilter();

      # 是否显示过滤条件 即隐藏搜索和表单类型过滤
      obj.hideFilter = options.hideFilter;

    #
    _setFilter: (type, text)->
      obj = this;

      obj.filterConfig = {
        keyf: ''
        valuef: ''
      }

      if arguments.length != 0
        obj.filterConfig.keyf = type
        obj.filterConfig.valuef = text

    #
    _eKeySearch: (e)->
      obj = this
      search = $.trim obj.ui.keywordSearch.val()

      if e.keyCode == ns.config.keyCode.ENTER
        if search == ''
          Alertify.log.info '请输入查询字符串'
          obj._setFilter();
          return;
        obj._setFilter 'search', search
        obj._ajaxGetFormData 1

    #
    _eClickSearch: (e)->

    #
    _eGetFormType: (e)->

    #
    _ajaxGetFormData: (e)->

    # 测试数据调用
    _debug: ()->

    # 处理接口返回的数据
    _handleResultData: (ret)->

    # 添加表单条目
    _addItems: (data)->

    #
    render: ()->

    #
    renderPage: ()->


  }

  Backbone.mixin Module1.views.ManageModule1, ns.viewMixins.Loading

  return Module1.views.ManageModule1;