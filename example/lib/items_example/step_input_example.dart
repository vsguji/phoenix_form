import 'package:flutter/material.dart';
import 'package:phoenix_form/phoenix_form.dart';

class StepInputExamplePage extends StatefulWidget {
  final String title;

  const StepInputExamplePage({Key? key, this.title = '示例'}) : super(key: key);

  @override
  State<StepInputExamplePage> createState() => _StepInputExamplePageState();
}

class _StepInputExamplePageState extends State<StepInputExamplePage> {
  TextEditingController _manualInputController = TextEditingController()
    ..text = '23';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
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
            StepInputFormItem(
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              value: 3,
              maxLimit: 5,
              minLimit: 1,
              onTip: () {
                //BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                // BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                //BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (oldValue, newValue) {
                // BrnToast.show(
                //     "点击触发回调${oldValue}_${newValue}_onChanged", context);
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
            StepInputFormItem(
              prefixIconType: PrefixIconType.add,
              isRequire: true,
              isEdit: true,
              error: "必填项不能为空",
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              maxLimit: 5,
              minLimit: 1,
              onTip: () {
                // BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                // BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                // BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (oldValue, newValue) {
                // BrnToast.show(
                //     "点击触发回调${oldValue}_${newValue}_onChanged", context);
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
            StepInputFormItem(
              prefixIconType: PrefixIconType.remove,
              isRequire: true,
              isEdit: true,
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              maxLimit: 5,
              minLimit: 1,
              onTip: () {
                //BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                // BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                // BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (oldValue, newValue) {
                // BrnToast.show(
                //     "点击触发回调${oldValue}_${newValue}_onChanged", context);
              },
            ),
            StepInputFormItem(
              prefixIconType: PrefixIconType.add,
              isRequire: true,
              isEdit: true,
              canManualInput: true,
              controller: _manualInputController,
              title: "可手动输入",
              subTitle: "可传入 controller设置初始值 ",
              maxLimit: 99,
              minLimit: 0,
              onTip: () {
                //BrnToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                // BrnToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                // BrnToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (oldValue, newValue) {
                //  BrnToast.show(
                //    "点击触发回调_${oldValue}_${newValue}_onChanged", context);
              },
            ),
          ],
        ));
  }
}
