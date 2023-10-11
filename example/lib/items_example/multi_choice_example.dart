import 'package:flutter/material.dart';
import 'package:phoenix_form/phoenix_form.dart';

class MultiChoiceInputExamplePage extends StatelessWidget {
  final String _title;

  MultiChoiceInputExamplePage(this._title);

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
            MultiChoiceInputFormItem(
              title: "自然",
              options: const ["固定", "永久", "未知"],
              value: const [
                "固定",
                "永久",
              ],
              onTip: () {
                // BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                // BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                // BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (List<String> oldValue, List<String>? newValue) {
                // BrnToast.show(
                //     "点击触发onChanged回调${oldValue.length}_${newValue!.length}_onChanged",
                //    context);
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
            MultiChoiceInputFormItem(
              prefixIconType: PrefixIconType.add,
              isRequire: true,
              error: "必填项不能为空",
              title: "自然",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              options: const [
                "固定",
                "永久",
              ],
              value: const [
                "固定",
              ],
              enableList: const [true, false],
              onTip: () {
                // BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                // BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                // BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (List<String> oldValue, List<String>? newValue) {
                // BrnToast.show(
                //     "点击触发onChanged回调${oldValue.length}_${newValue!.length}_onChanged",
                //     context);
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
            MultiChoiceInputFormItem(
              prefixIconType: PrefixIconType.remove,
              isRequire: true,
              title: "自然到",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              options: const [
                "固定",
                "永久",
              ],
              value: const [
                "固定",
              ],
              enableList: const [true, true],
              onTip: () {
                // BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                // BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                // BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (List<String> oldValue, List<String> newValue) {
                // BrnToast.show(
                //     "点击触发onChanged回调${oldValue.length}_${newValue.length}_onChanged",
                //    context);
              },
            ),
          ],
        ));
  }
}
