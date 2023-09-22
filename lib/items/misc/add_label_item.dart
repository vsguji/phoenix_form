/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-13 20:09:03
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-22 17:35:40
 * @FilePath: /phoenix_form/lib/items/misc/brn_add_label_item.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_form/extension/form_total_config.dart';

import '../../config/form_config.dart';
import '../../utils/form_util.dart';

/// 添加组类型录入项所使用的Widget
// ignore: must_be_immutable
class AddLabel extends StatefulWidget {
  /// 录入项的唯一标识，主要用于录入类型页面框架中
  final String? label;

  /// 标题文案
  final String title;

  /// 是否可编辑
  final bool isEdit;

  /// 点击录入区回调
  final VoidCallback? onTap;

  /// 背景色
  final Color? backgroundColor;

  /// form配置
  FormItemConfig? themeData;

  AddLabel({
    Key? key,
    this.label,
    this.title = "",
    this.isEdit = true,
    this.backgroundColor,
    this.onTap,
    this.themeData,
  }) : super(key: key) {
    themeData ??= FormItemConfig();
    themeData = BaseThemeConfig.instance
        .getConfig(configId: themeData!.configId)
        .formItemConfig
        .merge(themeData);
    themeData =
        themeData!.merge(FormItemConfig(backgroundColor: backgroundColor));
  }

  @override
  AddLabelState createState() {
    return AddLabelState();
  }
}

class AddLabelState extends State<AddLabel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!FormUtil.isEdit(widget.isEdit)) {
          return;
        }

        FormUtil.notifyAddTap(context, widget.onTap);
      },
      child: Container(
        color: widget.themeData!.backgroundColor,
        padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
        child: Text(
          widget.title,
          style: TextStyle(
            color:
                BaseThemeConfig.instance.getConfig().commonConfig.brandPrimary,
            fontSize: BaseFonts.f18,
          ),
        ),
      ),
    );
  }
}
