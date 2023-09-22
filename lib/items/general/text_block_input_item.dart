import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_form/extension/form_total_config.dart';

import '../../base/form_item_type.dart';
import '../../config/form_config.dart';
import '../../utils/form_util.dart';

///
/// 文本块输入型录入项
///
/// 包括"标题"、"副标题"、"错误信息提示"、"必填项提示"、"添加/删除按钮"、"消息提示"、
/// "文本输入框"等元素
///
// ignore: must_be_immutable
class TextBlockInputFormItem extends StatefulWidget {
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

  /// 输入字符数上限
  final int? maxCharCount;

  /// 录入项 hint 提示
  final String? hint;

  /// 输入内容类型
  final String? inputType;

  /// 是否自动获取焦点
  bool autofocus;

  /// 指定对输入数据的格式化要求
  final List<TextInputFormatter>? inputFormatters;

  /// 输入回调
  final ValueChanged<String>? onChanged;

  final TextEditingController? controller;

  /// 最小行数，默认值4
  final int? minLines;

  /// 最大行数，默认值20
  final int? maxLines;

  /// 背景色
  final Color? backgroundColor;

  /// form配置
  FormItemConfig? themeData;

  TextBlockInputFormItem(
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
      this.onChanged,
      this.hint,
      this.maxCharCount,
      this.autofocus = false,
      this.inputType,
      this.inputFormatters,
      this.controller,
      this.minLines = 4,
      this.maxLines = 20,
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
  TextBlockInputFormItemState createState() {
    return TextBlockInputFormItemState();
  }
}

class TextBlockInputFormItemState extends State<TextBlockInputFormItem> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
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
            child: Container(
              padding: FormUtil.titleEdgeInsets(
                  widget.prefixIconType, widget.isRequire, widget.themeData!),
              child: Row(
                children: <Widget>[
                  // 添加/删除 按钮
                  FormUtil.buildPrefixIcon(widget.prefixIconType, widget.isEdit,
                      context, widget.onAddTap, widget.onRemoveTap),
                  // 是否必填图标
                  FormUtil.buildRequireWidget(widget.isRequire),

                  // title
                  FormUtil.buildTitleWidget(widget.title, widget.themeData!),

                  FormUtil.buildTipLabelWidget(
                      widget.tipLabel, widget.onTip, widget.themeData!),
                ],
              ),
            ),
          ),

          // 副标题
          FormUtil.buildSubTitleWidget(widget.subTitle, widget.themeData!),

          // 错误提示
          FormUtil.buildErrorWidget(widget.error, widget.themeData!),

          // 输入框
          Container(
            padding: FormUtil.errorEdgeInsets(widget.themeData!),
            child: TextField(
              autofocus: widget.autofocus,
              keyboardType: FormUtil.getInputType(widget.inputType),
              controller: _controller,
              maxLength: widget.maxCharCount,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              maxLines: widget.maxLines,
              minLines: widget.minLines,
              textAlign: TextAlign.left,
              enabled: widget.isEdit,
              style:
                  FormUtil.getIsEditTextStyle(widget.themeData!, widget.isEdit),
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                hintText: widget.hint ??
                    BrnIntl.of(context).localizedResource.pleaseEnter,
                hintStyle: FormUtil.getHintTextStyle(widget.themeData!),
                contentPadding: const EdgeInsets.all(0),
                border: InputBorder.none,
                isDense: true,
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
              ),
              onChanged: (text) {
                FormUtil.notifyInputChanged(widget.onChanged, text);
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
  }
}