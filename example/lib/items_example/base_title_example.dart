/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2022-04-29 17:06:50
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-10-11 20:31:25
 * @FilePath: /phoenix_form/example/lib/items_example/base_title_example.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_form/phoenix_form.dart';

class BaseTitleExamplePage extends StatelessWidget {
  final String _title;

  BaseTitleExamplePage(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: const Text(
                "基本样式：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            BaseTitle(
              title: "基本样式",
              subTitle: "这里是副标题",
              onTip: () {
                // BrnToast.show("点击触发回调_onTip", context);
              },
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: const Text(
                "自定义右侧区域视图样式：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            BaseTitle(
              error: "必填项不能为空",
              title: "全功能样式",
              subTitle: "这里是副标题",
              tipLabel: "提示",
              isRequire: true,
              customActionWidget: Container(
                color: Colors.lightBlue,
                child: const Center(
                    child:
                        Text('我是自定义视图', style: TextStyle(color: Colors.white))),
              ),
              onTip: () {
                // BrnToast.show("点击触发回调_onTip", context);
              },
            ),
          ],
        ));
  }
}
