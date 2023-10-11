/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2022-07-08 14:25:37
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-10-11 20:28:04
 * @FilePath: /phoenix_form/example/lib/group_example/expand_form_group_example.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_form/phoenix_form.dart';

class ExpendFormGroupExample extends StatelessWidget {
  final String _title;

  ExpendFormGroupExample(this._title);

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
                "基本样式",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            ExpandableGroup(
              title: "展开收起分组",
              subtitle: "带箭头类型的子标题",
              backgroundColor: Colors.blue,
              children: [
                TextInputFormItem(
                  title: "示例子项1",
                  hint: "请输入",
                  onChanged: (newValue) {
                    // BrnToast.show("点击触发回调_${newValue}_onChanged", context);
                  },
                ),
                TextInputFormItem(
                  title: "示例子项2",
                  hint: "请输入",
                  onChanged: (newValue) {
                    // BrnToast.show("点击触发回调_${newValue}_onChanged", context);
                  },
                ),
                TextInputFormItem(
                  title: "示例子项3",
                  hint: "请输入",
                  onChanged: (newValue) {
                    // BrnToast.show("点击触发回调_${newValue}_onChanged", context);
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
