/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2022-04-29 17:06:50
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-10-11 20:31:55
 * @FilePath: /phoenix_form/example/lib/items_example/general_item_example.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_form/phoenix_form.dart';

class GeneralFormExamplePage extends StatelessWidget {
  final String _title;

  GeneralFormExamplePage(this._title);

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
              child: const Text("基本样式：",
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 22,
                  )),
            ),
            GeneralFormItem(
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              onTip: () {
                // BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                // BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                // BrnToast.show("点击触发onRemoveTap回调", context);
              },
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
            GeneralFormItem(
              prefixIconType: PrefixIconType.add,
              isRequire: true,
              isEdit: true,
              error: "必填项不能为空",
              titleWidget: const Text("自然到访保护期"),
              subTitleWidget: const Text("这里是副标题"),
              tipLabel: "标签",
              operateWidget: const Text("右侧操作区"),
              onTip: () {
                // BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                // BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                // BrnToast.show("点击触发onRemoveTap回调", context);
              },
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: const Text(
                "no error：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            GeneralFormItem(
              prefixIconType: PrefixIconType.add,
              isRequire: true,
              isEdit: true,
              titleWidget: const Text("自然到访保护期"),
//              subTitleWidget: Text("这里是副标题"),
              tipLabel: "标签",
              operateWidget: const Text("右侧操作区"),

              onTip: () {
                //  BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                // BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                //  BrnToast.show("点击触发onRemoveTap回调", context);
              },
            ),
          ],
        ));
  }
}
