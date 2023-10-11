/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2022-04-29 16:53:03
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-10-11 20:29:59
 * @FilePath: /phoenix_form/example/lib/group_example/group_add_example.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_form/phoenix_form.dart';

class GroupAddExamplePage extends StatelessWidget {
  final String _title;

  GroupAddExamplePage(this._title);

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
            AddLabel(
              title: "添加组",
              onTap: () {
                // BrnToast.show("点击触发onTap回调", context);
              },
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: const Text(
                "全功能样式-禁用：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            AddLabel(
              isEdit: false,
              title: "添加组",
              onTap: () {
                // BrnToast.show("点击触发onTap回调", context);
              },
            ),
          ],
        ));
  }
}
