<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    import="dao.DataBean" pageEncoding="ISO-8859-1"%>
<%
DataBean obj=new DataBean();
   String filedir=getServletContext().getRealPath("/data.csv");
   obj.getData(filedir);
   
   String stringDate=obj.getStrDate();
   String stringAll=obj.getStrAll();
   String stringRecog=obj.getStrRecognized();
   String stringRate=obj.getStrRate();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bid Recognition Graph</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
    $('#container').highcharts({
        chart: {
            type: 'area',
            zoomType: 'xy'
        },
        title: {
            text: 'Bid Recognition chart, August 2013'
        },
        subtitle: {
            text: 'Candidate: Weijie Wang'
        },
        xAxis: {
            categories: <%=stringDate%>,
            tickmarkPlacement: 'on',
            title: {
                enabled: true,
                text: '<b>Days</b>',
                style: {
                    fontWeight: 'normal'
                }
            }
        },
        yAxis: [{ // first yAxis
        	min: -30,
        	max: 100,
        	tickInterval: 20,
         title: {
                text: 'Rate',
                style: {
                    color: '#89A54E'
                }
            },
            labels: {
                format: '{value} %',
                style: {
                    color: '#89A54E'
                }
            }
        }, { // Secondary yAxis
            title: {
                text: 'Bid Requests',
                style: {
                    color: '#4572A7'
                }
            },
            labels: {
            	format: '{value}',
            	style: {
                    color: '#4572A7'
                }
            },
            opposite: true
        }],
        tooltip: {
            shared: true
        },
        plotOptions: {
            area: {
                stacking: 'normal',
                lineColor: '#666666',
                lineWidth: 1,
                marker: {
                    lineWidth: 1,
                    lineColor: '#666666'
                }
            }
        },
        series: [{
            name: 'Recognized',
            type: 'area',
            yAxis: 1,
            tooltip: {
                valueSuffix: ' Requests'
            },
            data: <%=stringRecog%>
        },{
            name: 'All',
            type: 'area',
            yAxis: 1,
            tooltip: {
                valueSuffix: ' Requests'
            },
            data: <%=stringAll%>
        },{
            name: 'Rate',
            type: 'line',
            tooltip: {
                valueSuffix: ' %'
            },
            data: <%=stringRate%>
        }]
    });
});
</script>
</head>
<body>
   <script src="Scripts/highcharts.js"></script>
   <script src="Scripts/exporting.js"></script>
   <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
</body>
</html>