import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_form/extension/form_total_config.dart';

import '../../base/form_item_type.dart';
import '../../config/form_config.dart';
import '../../utils/form_util.dart';

///
/// 范围输入型录入项
///
/// 包括"标题"、"副标题"、"错误信息提示"、"必填项提示"、"添加/删除按钮"、"消息提示"、
/// "输入框"等元素
///
// ignore: must_be_immutable
class RangeInputFormItem extends StatefulWidget {
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

  /// 录入项不可编辑时(isEdit: false) "+"、"-"号是否可点击
  /// true: 可点击回调 false: 不可点击回调
  /// 默认值: false
  final bool isPrefixIconEnabled;

  /// 点击"+"图标回调
  final VoidCallback? onAddTap;

  /// 点击"-"图标回调
  final VoidCallback? onRemoveTap;

  /// 点击"？"图标回调
  final VoidCallback? onTip;

  /// 最小值提示语
  String? hintMin;

  /// 最大值提示语
  String? hintMax;

  /// 最小值单位
  final String? minUnit;

  /// 最大值单位
  final String? maxUnit;

  /// 最小值输入框最大字符数
  final int? leftMaxCount;

  /// 最大值输入框最大字符数
  final int? rightMaxCount;

  /// 输入内容类型，参见[BrnInputType]
  final String? inputType;

  final TextEditingController? minController;
  final TextEditingController? maxController;
  List<TextInputFormatter>? minInputFormatters;
  List<TextInputFormatter>? maxInputFormatters;

  /// 最小值输入回调
  final ValueChanged<String>? onMinChanged;

  /// 最大值输入回调
  final ValueChanged<String>? onMaxChanged;

  /// 背景色
  final Color? backgroundColor;

  /// form配置
  FormItemConfig? themeData;

  RangeInputFormItem(
      {Key? key,
      this.label,
      this.title = "",
      this.subTitle,
      this.tipLabel,
      this.prefixIconType = PrefixIconType.normal,
      this.error = "",
      this.isEdit = true,
      this.isRequire = false,
      this.isPrefixIconEnabled = false,
      this.onAddTap,
      this.onRemoveTap,
      this.onTip,
      this.hintMin,
      this.hintMax,
      this.minUnit,
      this.maxUnit,
      this.leftMaxCount,
      this.rightMaxCount,
      this.inputType,
      this.onMinChanged,
      this.onMaxChanged,
      this.minController,
      this.maxController,
      this.minInputFormatters,
      this.maxInputFormatters,
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
  RangeInputFormItemState createState() {
    return RangeInputFormItemState();
  }
}

class RangeInputFormItemState extends State<RangeInputFormItem> {
  late TextEditingController _minController;
  late TextEditingController _maxController;
  late FormItemConfig config;

  @override
  void initState() {
    config = BaseThemeConfig.instance.getConfig().formItemConfig;
    _minController = widget.minController ?? TextEditingController();
    _maxController = widget.maxController ?? TextEditingController();

    super.initState();
  }

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
                      FormUtil.buildPrefixIcon(
                          widget.prefixIconType,
                          widget.isEdit,
                          context,
                          widget.onAddTap,
                          widget.onRemoveTap),
                      FormUtil.buildRequireWidget(widget.isRequire),
                      FormUtil.buildTitleWidget(
                          widget.title, widget.themeData!),
                      FormUtil.buildTipLabelWidget(
                          widget.tipLabel, widget.onTip, widget.themeData!),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 50,
                        ),
                        child: TextField(
                          keyboardType: FormUtil.getInputType(widget.inputType),
                          enabled: widget.isEdit,
                          maxLines: 1,
                          maxLength: widget.leftMaxCount,
                          style: FormUtil.getIsEditTextStyle(
                              widget.themeData!, widget.isEdit),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle:
                                FormUtil.getHintTextStyle(widget.themeData!),
                            hintText: widget.hintMin ??
                                BrnIntl.of(context).localizedResource.min,
                            counterText: "",
                            contentPadding: const EdgeInsets.all(0),
                            isDense: true,
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                          textAlign: TextAlign.end,
                          controller: _minController,
                          onChanged: (text) {
                            FormUtil.notifyInputChanged(
                                widget.onMinChanged, text);
                          },
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          widget.minUnit ?? "",
                          style: const TextStyle(
                            color: Color(0xFF101010),
                            fontSize: BaseFonts.f16,
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.only(left: 20, right: 6),
                        child: const Text(
                          "—",
                          style: TextStyle(
                            color: Color(0xFF101010),
                            fontSize: BaseFonts.f16,
                          ),
                        )),
                    Container(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 50,
                        ),
                        child: TextField(
                          keyboardType: FormUtil.getInputType(widget.inputType),
                          enabled: widget.isEdit,
                          maxLines: 1,
                          maxLength: widget.rightMaxCount,
                          style: FormUtil.getIsEditTextStyle(
                              widget.themeData!, widget.isEdit),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle:
                                FormUtil.getHintTextStyle(widget.themeData!),
                            hintText: widget.hintMax ??
                                BrnIntl.of(context).localizedResource.max,
                            counterText: "",
                            contentPadding: const EdgeInsets.all(0),
                            isDense: true,
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                          ),
                          textAlign: TextAlign.end,
                          controller: _maxController,
                          onChanged: (text) {
                            FormUtil.notifyInputChanged(
                                widget.onMaxChanged, text);
                          },
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          widget.maxUnit ?? "",
                          style: const TextStyle(
                            color: Color(0xFF101010),
                            fontSize: BaseFonts.f16,
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),

          // 副标题
          FormUtil.buildSubTitleWidget(widget.subTitle, widget.themeData!),

          FormUtil.buildErrorWidget(widget.error, widget.themeData!)
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // 如果controller由外部创建不需要销毁, 若由内部创建则需要销毁
    _minController.dispose();
    _maxController.dispose();
  }
}
