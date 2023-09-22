/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-08-31 14:41:55
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-22 17:35:36
 * @FilePath: /phoenix_form/lib/items/title/select_all_title_item.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/widgets.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_form/extension/form_total_config.dart';

import '../../base/input_item_interface.dart';
import '../../config/form_config.dart';
import '../../utils/form_util.dart';
import 'base_title_item.dart';
import 'package:phoenix_radio/phoenix_radio.dart' as phoenix show Checkbox;

///
/// 全选类型类型录入项
///
/// 包括"标题"、"副标题"、"错误信息提示"、"必填项提示"、"消息提示"、
///
// ignore: must_be_immutable
class SelectAllTitle extends StatefulWidget {
  /// 标题
  final String title;

  /// 子标题
  final String? subTitle;

  /// 是否必填项
  final bool isRequire;

  /// 是否可编辑
  final bool isEdit;

  /// 错误提示文案
  final String error;

  /// 录入项提示（问号图标&文案） 用户点击时触发onTip回调。
  /// 1. 若赋值为 空字符串（""）时仅展示"问号"图标，
  /// 2. 若赋值为非空字符串时 展示"问号图标&文案"，
  /// 3. 若不赋值或赋值为null时 不显示提示项
  /// 默认值为 3
  final String? tipLabel;

  /// 标题Widget
  final Widget? titleWidget;

  /// 子标题Widget
  final Widget? subTitleWidget;

  /// 右侧自定义操作区
  final Widget? customActionWidget;

  /// 点击"？"图标回调
  final VoidCallback? onTip;

  /// 全选状态回调
  final OnBrnFormSelectAll? onSelectAll;

  /// 选中项文案
  final String? selectText;

  /// 选中项Widget
  final Widget? selectTextWidget;

  /// 选中项状态
  final bool selectState;

  /// 背景色
  final Color? backgroundColor;

  /// form配置
  FormItemConfig? themeData;

  SelectAllTitle({
    Key? key,
    this.title = "",
    this.subTitle,
    this.isRequire = false,
    this.isEdit = true,
    this.error = "",
    this.tipLabel,
    this.titleWidget,
    this.subTitleWidget,
    this.onTip,
    this.onSelectAll,
    this.selectText,
    this.selectTextWidget,
    this.selectState = true,
    this.themeData,
    this.customActionWidget,
    this.backgroundColor,
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
  State<StatefulWidget> createState() {
    return SelectAllTitleState();
  }
}

class SelectAllTitleState extends State<SelectAllTitle> {
  late bool _selectState;

  @override
  void initState() {
    super.initState();
    _selectState = widget.selectState;
  }

  @override
  void didUpdateWidget(SelectAllTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    _selectState = oldWidget.selectState;
  }

  @override
  Widget build(BuildContext context) {
    return BaseTitle(
      key: widget.key,
      title: widget.title,
      subTitle: widget.subTitle,
      isRequire: widget.isRequire,
      error: widget.error,
      tipLabel: widget.tipLabel,
      titleWidget: widget.titleWidget,
      subTitleWidget: widget.subTitleWidget,
      customActionWidget: phoenix.Checkbox(
        radioIndex: 0,
        disable: !widget.isEdit,
        isSelected: _selectState,
        onValueChangedAtIndex: (position, value) {
          if (!widget.isEdit) {
            return;
          }

          _selectState = value;

          if (widget.onSelectAll != null) {
            widget.onSelectAll!(position, value);
          }
        },
        child: getSelectTextWidget(),
      ),
      onTip: widget.onTip,
    );
  }

  Widget? getSelectTextWidget() {
    if (widget.selectTextWidget != null) {
      return widget.selectTextWidget;
    } else {
      return Container(
        child: Text(
          widget.selectText ?? "",
          style: getOptionTextStyle(widget.themeData),
        ),
      );
    }
  }

  TextStyle getOptionTextStyle(FormItemConfig? themeData) {
    if (_selectState) {
      return FormUtil.getOptionSelectedTextStyle(widget.themeData!);
    }
    if (!widget.isEdit) {
      return FormUtil.getIsEditTextStyle(widget.themeData!, widget.isEdit);
    }
    return FormUtil.getOptionTextStyle(widget.themeData!);
  }
}
