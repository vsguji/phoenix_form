import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_form/extension/form_total_config.dart';

import '../../base/form_item_type.dart';
import '../../config/form_config.dart';
import '../../utils/form_util.dart';

/// 标题类型录入项
// ignore: must_be_immutable
class TitleFormItem extends StatefulWidget {
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

  /// 录入项 是否可编辑
  final bool isEdit;

  /// 录入项是否为必填项（展示*图标） 默认为 false 不必填
  final bool isRequire;

  /// 点击"？"图标回调
  final VoidCallback? onTip;

  /// 点击操作区标识
  final String? operationLabel;

  /// 点击回调
  final VoidCallback? onTap;

  /// 背景色
  final Color? backgroundColor;

  /// form配置
  FormItemConfig? themeData;

  TitleFormItem(
      {Key? key,
      this.label,
      this.title = "",
      this.subTitle,
      this.tipLabel,
      this.prefixIconType = PrefixIconType.normal,
      this.error = "",
      this.isEdit = true,
      this.isRequire = false,
      this.onTip,
      this.operationLabel,
      this.onTap,
      this.backgroundColor,
      this.themeData})
      : super(key: key) {
    themeData ??= FormItemConfig();
    themeData = BaseThemeConfig.instance
        .getConfig(configId: themeData!.configId)
        .formItemConfig
        .merge(themeData);
    themeData =
        themeData!.merge(FormItemConfig(backgroundColor: backgroundColor));
  }

  @override
  TitleFormItemState createState() {
    return TitleFormItemState();
  }
}

class TitleFormItemState extends State<TitleFormItem> {
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
                      // 必填项
                      FormUtil.buildRequireWidget(widget.isRequire),
                      // 主标题
                      Container(
                          child: Text(
                        widget.title,
                        style:
                            FormUtil.getHeadTitleTextStyle(widget.themeData!),
                      )),
                      // 问号提示
                      FormUtil.buildTipLabelWidget(
                          widget.tipLabel, widget.onTip, widget.themeData!),
                    ],
                  ),
                ),

                // 自定义操作区
                Offstage(
                  offstage: (widget.operationLabel == null),
                  child: GestureDetector(
                    onTap: () {
                      if (!FormUtil.isEdit(widget.isEdit)) {
                        return;
                      }

                      FormUtil.notifyTap(context, widget.onTap);
                    },
                    child: Container(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          widget.operationLabel ?? "",
                          style: TextStyle(
                            color: widget.themeData!.commonConfig.brandPrimary,
                            fontSize: BaseFonts.f16,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),

          // 副标题
          FormUtil.buildSubTitleWidget(widget.subTitle, widget.themeData!),

          // 错误提示
          FormUtil.buildErrorWidget(widget.error, widget.themeData!)
        ],
      ),
    );
  }
}
