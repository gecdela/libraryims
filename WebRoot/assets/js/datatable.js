$(document).ready( function () {
  var eventFired = function(type) {
/*         var n = $('#demo_info')[0];
        n.innerHTML += '<div>' + type + ' 事件- ' + new Date().getTime() + '</div>';
        n.scrollTop = n.scrollHeight; */
    }
    $("#table_id_example").on('order.dt',function(){eventFired("排序");}).on('page.dt',function(){eventFired("翻页");}).DataTable({
    	//data:dataSet,//数据集

    	pagingType:"full_numbers",//分页样式
    	scrollY:false,//滚动条长度
    	scrollX: false,//指定是否开启横向滚动条
    	scrollCollapse:"true",
    	stateSave:true,//保存状态
    	paging:true,//是否分页
    	ordering:true, //是否排序
    	info:true, //是否显示页面信息
		columnDefs:[{
			target:[1],
			orderData:[0,1],
	
		}],
    	decimal:",",	//指定数字显示格式
    	thousands:".",
    	language:{
                 "lengthMenu": "每页 _MENU_ 条记录",
                 "zeroRecords": "没有找到记录",
                 "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
                 "infoEmpty": "无记录",
                 "infoFiltered": "(从 _MAX_ 条记录过滤)"
             },
		order:[[5,"desc"]], //默认排序列和排序方式
		 lengthMenu: [[8, 10, 12, -1], [8, 10, 12, "All"]], //指定每页显示的长度
		 processing: true,
		 columns: [
		    null,
		    null,
		    null,
		    null,
		    null,
		    { "orderable": false },
		    { "orderable": false },		    
		  ]
		}
        );
    
});	
   
