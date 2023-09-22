import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_form/extension/form_total_config.dart';
import 'package:phoenix_switch/phoenix_switch.dart';

import '../../base/form_item_type.dart';
import '../../base/input_item_interface.dart';
import '../../config/form_config.dart';
import '../../utils/form_util.dart';

/// 带开关按钮表单
// ignore: must_be_immutable
class SwitchFormItem extends StatefulWidget {
  /// 录入项的唯一标识，主要用于录入类型页面框架中
  final String? label;

  /// 录入项标题
  final String title;

  /// 录入项子标题
  final String? subTitle;

  /// 录入项提示（问号图标&文案） 用户点击时触发onTip回调。
  /// 1. 若赋值为 空字符串（""）时仅展示"问号"图标，
  /// 2. 若赋值为非空字符串时 展示"问号图标&文案"，
  /// 3. 若不赋值或赋值为null时 不显示提示项
  /// 默认值为 3
  final String? tipLabel;

  /// 录入项前缀图标样式 "添加项" "删除项" 详见 PrefixIconType类
  final String prefixIconType;

  /// 录入项错误提示
  final String error;

  /// 录入项是否为必填项（展示*图标） 默认为 false 不必填
  final bool isRequire;

  /// 录入项 是否可编辑
  final bool isEdit;

  /// 点击"+"图标回调
  final VoidCallback? onAddTap;

  /// 点击"-"图标回调
  final VoidCallback? onRemoveTap;

  /// 点击"？"图标回调
  final VoidCallback? onTip;

  /// 特有字段
  final bool value;

  /// 开关变化回调
  final OnBrnFormSwitchChanged? onChanged;

  /// 背景色
  final Color? backgroundColor;

  /// form配置
  FormItemConfig? themeData;

  SwitchFormItem({
    Key? key,
    this.label,
    this.title = "",
    this.subTitle,
    this.tipLabel,
    this.prefixIconType = PrefixIconType.normal,
    this.error = "",
    this.isEdit = true,
    this.isRequire = true,
    this.onAddTap,
    this.onRemoveTap,
    this.onTip,
    required this.value,
    this.onChanged,
    this.backgroundColor,
    this.themeData,
  }) : super() {
    themeData ??= FormItemConfig();
    themeData = BaseThemeConfig.instance
        .getConfig(configId: themeData!.configId)
        .formItemConfig
        .merge(themeData);
    themeData =
        themeData!.merge(FormItemConfig(backgroundColor: backgroundColor));
  }

  @override
  SwitchFormItemState createState() {
    return SwitchFormItemState();
  }
}

class SwitchFormItemState extends State<SwitchFormItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.themeData!.backgroundColor,
      padding: FormUtil.itemEdgeInsets(widget.themeData!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: FormUtil.titleEdgeInsets(widget.prefixIconType,
                      widget.isRequire, widget.themeData!),
                  child: Row(
                    children: <Widget>[
                      Offstage(
                        offstage:
                            (widget.prefixIconType == PrefixIconType.normal),
                        child: Container(
                          padding: const EdgeInsets.only(right: 6),
                          child: GestureDetector(
                            onTap: () {
                              if (!FormUtil.isEdit(widget.isEdit)) {
                                return;
                              }

                              FormUtil.notifyAddRemoveTap(
                                  context,
                                  widget.prefixIconType,
                                  widget.onAddTap,
                                  widget.onRemoveTap);
                            },
                            child:
                                FormUtil.getPrefixIcon(widget.prefixIconType),
                          ),
                        ),
                      ),
                      Offstage(
                        offstage: (!widget.isRequire),
                        child: FormUtil.getRequireIcon(widget.isRequire),
                      ),
                      Container(
                          child: Text(
                        widget.title,
                        style: FormUtil.getTitleTextStyle(widget.themeData!),
                      )),
                      Offstage(
                        offstage: (widget.tipLabel == null),
                        child: GestureDetector(
                          onTap: () {
                            if (widget.onTip != null) {
                              widget.onTip!();
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  padding:
                                      const EdgeInsets.only(left: 6, right: 7),
                                  child: FormUtil.getQuestionMarkIcon()),
                              Container(
                                child: Text(
                                  widget.tipLabel ?? "",
                                  style: FormUtil.getTipsTextStyle(
                                      widget.themeData!),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SwitchButton(
                  size: const Size(42, 25),
                  value: widget.value,
                  enabled: widget.isEdit,
                  onChanged: (bool value) {
                    bool oldValue = widget.value;
                    FormUtil.notifySwitchChanged(
                        widget.onChanged, context, oldValue, value);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),

          /// 副标题
          Offstage(
            offstage: (widget.subTitle == null || widget.subTitle!.isEmpty),
            child: Container(
                padding: FormUtil.subTitleEdgeInsets(widget.themeData!),
                child: Text(
                  widget.subTitle ?? "",
                  style: FormUtil.getSubTitleTextStyle(widget.themeData!),
                )),
          ),

          Offstage(
            offstage: (widget.error.isEmpty),
            child: Container(
              padding: FormUtil.errorEdgeInsets(widget.themeData!),
              child: Text(
                widget.error,
                style: FormUtil.getErrorTextStyle(widget.themeData!),
              ),
            ),
          )
        ],
      ),
    );
  }
}
