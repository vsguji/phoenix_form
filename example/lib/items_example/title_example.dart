import 'package:flutter/material.dart';
import 'package:phoenix_form/phoenix_form.dart';

class TitleExamplePage extends StatelessWidget {
  final String _title;

  TitleExamplePage(this._title);

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
            TitleFormItem(
              title: "自然到访保护期",
              operationLabel: "点击操作",
              onTip: () {
                // BrnToast.show("点击触发回调_onTip", context);
              },
              onTap: () {
                // BrnToast.show("点击触发回调_onTap", context);
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
            TitleFormItem(
              error: "必填项不能为空",
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "提示",
              operationLabel: "点击操作",
              onTip: () {
                //BrnToast.show("点击触发回调_onTip", context);
              },
              onTap: () {
                //BrnToast.show("点击触发回调_onTap", context);
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
            TitleFormItem(
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "提示",
              operationLabel: "点击操作",
              onTip: () {
                //BrnToast.show("点击触发回调_onTip", context);
              },
              onTap: () {
                //BrnToast.show("点击触发回调_onTap", context);
              },
            ),
          ],
        ));
  }
}
