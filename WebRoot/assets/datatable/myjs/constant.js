//表格全局设置,  配置已更新为新版本
//把公共的设置项都放在这里，就不需要每个页面都设置一遍了，放在jQuery对象上是为了避免污染全局变量
       $.fn.dtconfig =  {
            processing: true,//是否显示加载中提示
            autoWidth: false,//是否自动计算表格各列宽度
            info: true,//是否显示页数信息
            pagingType:"full_numbers",
            pageLength :10,//默认每页显示多少条记录
            searching: false,//是否显示搜索框
            ordering:false,//是否允许排序
            serverSide: true,//是否从服务器获取数据
            stateSave: false,//页面重载后保持当前页
            lengthChange: true,//是否显示每页大小的下拉框
            lengthMenu: [ 10, 15,25, 50, 75, 100 ],//长度菜单
            language: {
                lengthMenu: "每页显示 _MENU_记录",
                zeroRecords: "没有匹配的数据",
                info: "第_PAGE_页/共 _PAGES_页 ( 共\_TOTAL\_条记录 )",
                infoEmpty: "没有符合条件的记录",
                search: "查找",
                infoFiltered: "(从 _MAX_条记录中过滤)",
                paginate: { "first": "首页 ", "last": "末页", "next": "下一页", "previous": "上一页" }
            },
            responsive: true,
            scrollX: true,//横向滑动
            //deferRender: true,//控制表格的延迟渲染，可以提高初始化的速度
            //dom: 'lBrtip',//DataTables 各模块显示位置
            //buttons: [// DataTables Button 扩展，使用时，需要引入插件相关的JS
            //          //{
            //          //    extend: "copy",
            //          //    className: "btn-sm"
            //          //},
            //          //{
            //          //    extend: "csv",
            //          //    className: "btn-sm"
            //          //},
            //          {
            //              extend: "excel",
            //              text: "导出本页(Excel)",
            //              className: "btn-primary",
            //                filename:"人员表"
            //          },
            //          //{
            //          //    extend: "pdfHtml5",
            //          //    className: "btn-sm"
            //          //},
            //          //{
            //          //    extend: "print",
            //          //    className: "btn-sm"
            //          //},
            //]
        }
