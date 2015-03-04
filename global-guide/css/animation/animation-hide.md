<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [当 隐藏元素后，CSS 动画将不会执行](#当-隐藏元素后，css-动画将不会执行)
  - [测试用例](#测试用例)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 当 隐藏元素后，CSS 动画将不会执行

### 测试用例
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>animate</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      background: #ccc;
    }

    @-webkit-keyframes animate1 {
      0%, 100% {
        -webkit-transform: rotate(5deg);
        z-index: 2;
      }

      50% {
        -webkit-transform: rotate(-185deg);
        z-index: 1;
      }
    }

    .line {
      left: 0;
      top: 0;
      position: absolute;
      width: 80px;
      height: 6px;
    }
    
    .line1 {
      background: #39ebd5;
      -webkit-animation: animate1 1s cubic-bezier(0.455, 0.03, 0.515, 0.955) infinite;
      
    }
  </style>
</head>
<body>
  
  <div class="line line1"></div>
    
  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
  <script>
    $(function() {
      setInterval(function(){
        console.log($('.line1').css('-webkit-transform'));
      }, 100);
    });
  </script>
</body>
</html>
```
原理是在一定的时间间隔内，获取动画改变的属性的值，如果隐藏了 element，那些属性还在变化的话，表明动画还在继续进行，否则动画停止。
测试发现，使用 display: none 的方式，动画停止，但是使用 visibility: hidden 的方式，动画继续运行。