import 'package:flutter/material.dart';
import 'package:phoenix_form/phoenix_form.dart';

class ExpansionGroupExample extends StatelessWidget {
  final String _title;

  ExpansionGroupExample(this._title);

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
                "基本样式-收起",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            ExpandFormGroup(
              title: "展开收起分组",
              isExpand: false,
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
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: const Text(
                "基本样式-展开",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            ExpandFormGroup(
              title: "展开收起分组",
              isExpand: true,
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
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: const Text(
                "全功能样式：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            ExpandFormGroup(
              title: "展开收起分组",
              subTitle: "这里是副标题",
              deleteLabel: "删除",
              error: "必填项不能为空",
              isRequire: true,
              isEdit: true,
              onRemoveTap: () {
                // BrnToast.show("点击触发回调_onRemoveTap", context);
              },
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
