import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_form/extension/form_total_config.dart';
import 'package:phoenix_line/phoenix_line.dart';

import '../../config/form_config.dart';
import '../../utils/form_util.dart';

///
/// 可展开收起组类型录入项
/// 内部可包含其他类型Widget
///
/// 包括"标题"、"副标题"、"错误信息提示"、"必填项提示"、"添加/删除按钮"、"消息提示"
///
// ignore: must_be_immutable
class NormalFormGroup extends StatefulWidget {
  /// 录入项的唯一标识，主要用于录入类型页面框架中
  final String? label;

  /// 录入项标题
  final String title;

  /// 录入项子标题
  final String? subTitle;

  /// 录入项错误提示
  final String error;

  /// 录入项是否为必填项（展示*图标） 默认为 false 不必填
  final bool isRequire;

  /// 录入项 是否可编辑
  final bool isEdit;

  /// 点击"-"图标回调
  final VoidCallback? onRemoveTap;

  /// 点击"？"图标回调
  final VoidCallback? onTip;

  /// 右侧文案
  final String? deleteLabel;

  /// 内部子项
  final List<Widget> children;

  /// form配置
  FormItemConfig? themeData;

  NormalFormGroup({
    Key? key,
    this.label,
    this.title = "",
    this.subTitle,
    this.error = "",
    this.isEdit = true,
    this.isRequire = false,
    this.onRemoveTap,
    this.onTip,
    this.deleteLabel,
    this.themeData,
    required this.children,
  }) : super(key: key) {
    themeData ??= FormItemConfig();
    themeData = BaseThemeConfig.instance
        .getConfig(configId: themeData!.configId)
        .formItemConfig
        .merge(themeData);
  }

  @override
  NormalFormGroupState createState() {
    return NormalFormGroupState();
  }
}

class NormalFormGroupState extends State<NormalFormGroup> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14),
      color: widget.themeData!.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Offstage(
                  offstage: (widget.title.isEmpty),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: const EdgeInsets.only(left: 20, right: 6),
                            child: Text(
                              widget.title,
                              style: FormUtil.getHeadTitleTextStyle(
                                  widget.themeData!,
                                  isBold: true),
                            )),
                      ],
                    ),
                  ),
                ),
                Offstage(
                  offstage: widget.deleteLabel == null,
                  child: GestureDetector(
                    onTap: () {
                      if (!FormUtil.isEdit(widget.isEdit)) {
                        return;
                      }

                      FormUtil.notifyRemoveTap(context, widget.onRemoveTap);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        widget.deleteLabel ?? "",
                        style: const TextStyle(
                          color: Color(0xFFFA3F3F),
                          fontSize: BaseFonts.f16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 副标题
          Container(
            alignment: Alignment.centerLeft,
            padding: FormUtil.subTitleEdgeInsets(widget.themeData!),
            child: Offstage(
              offstage: (widget.subTitle == null || widget.subTitle!.isEmpty),
              child: Text(
                widget.subTitle ?? "",
                style: FormUtil.getSubTitleTextStyle(widget.themeData!),
              ),
            ),
          ),

          Container(
            child: Column(
              children: getSubItem(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getSubItem() {
    List<Widget> result = <Widget>[];

    if (widget.children.isEmpty) {
      return result;
    }

    for (Widget w in widget.children) {
      result.add(const Line());
      result.add(w);
    }

    return result;
  }
}
