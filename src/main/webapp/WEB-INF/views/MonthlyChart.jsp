<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/echarts/echarts.min.js"></script>

    <script type="text/javascript">

        $(function(){
            ajaxtest();
        });

        function ajaxtest() {
            $.ajax({
                async:false,
                url:'${pageContext.request.contextPath}/charts/monthlychart',
                type:'POST',
                dataType : 'json',//后台@ResponseBody返回的json数据是一个纯String类型的对象,dataType属性设置为text
                success:function (objects1) {//data是形参，随便取名，data表示的就是服务器返回的json格式的数据
                    initChart(objects1);
                }
            });
        }

        function formatData(data) {

            var xAxis = [];
            var serData =[];

            for(var i = 0 ; i < data.length ; i++){
                xAxis.push(data[i].name);
                console.log(xAxis);
                serData.push(data[i].value);
                console.log(serData);
            }
            return {
                xAxis : xAxis,
                serData : serData,
            };
        }

        function initChart(objects1) {
            var dom = document.getElementById("chartmain");
            var myChart = echarts.init(dom);

            var option = {
                title: {
                    text: '月销售额可视化',
                    textStyle: {
                        color: '#000'
                    }
                },
                backgroundColor: '#FFFFFF',
                textStyle: {
                    color: '#000',
                },
                tooltip: {},
                legend: {
                    data: ['消费额'],
                    textStyle: {
                        color: '#000'
                    }
                },
                xAxis: {
                    type: 'category',
                    data: formatData(objects1).xAxis,
                    axisLabel: {
                        interval: 0,//横轴信息全部显示
                        rotate: -30,//-30度角倾斜显示
                    }

                },

                yAxis: {},
                series: [{
                    name: '消费额',
                    type: 'bar',
                    data: formatData(objects1).serData,
                }]
            };

            myChart.setOption(option, true);

        };

    </script>

</head>
<body>

<div style="width: 100%;height: 100%" id="chartmain" style="width: 100%;height:660px;"></div>


</body>
</html>
