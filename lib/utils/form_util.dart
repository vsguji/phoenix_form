import 'package:flutter/widgets.dart';
import 'package:phoenix_base/phoenix.dart';

import '../base/form_item_type.dart';
import '../base/input_item_interface.dart';
import '../config/form_config.dart';

///
/// UI配置相关
///
class FormUtil {
  /// 获取添加、删除图标
  static Widget buildPrefixIcon(String prefixIconType, bool isEdit,
      BuildContext context, VoidCallback? onAddTap, VoidCallback? onRemoveTap) {
    return Offstage(
      offstage: prefixIconType == PrefixIconType.normal,
      child: Container(
        padding: const EdgeInsets.only(right: 6),
        child: GestureDetector(
          onTap: () {
            if (!FormUtil.isEdit(isEdit)) {
              return;
            }

            FormUtil.notifyAddRemoveTap(
                context, prefixIconType, onAddTap, onRemoveTap);
          },
          child: FormUtil.getPrefixIcon(prefixIconType),
        ),
      ),
    );
  }

  /// 获取错误提示widget
  static Widget buildErrorWidget(String error, FormItemConfig themeData) {
    return Offstage(
      offstage: error.isEmpty,
      child: Container(
        padding: errorEdgeInsets(themeData),
        child: Text(error, style: getErrorTextStyle(themeData)),
      ),
    );
  }

  /// 获取子标题Widget
  static Widget buildSubTitleWidget(
      String? subTitle, FormItemConfig themeData) {
    return Offstage(
      offstage: (subTitle == null || subTitle.isEmpty),
      child: Container(
          padding: subTitleEdgeInsets(themeData),
          child: Text(
            subTitle ?? "",
            style: getSubTitleTextStyle(themeData),
          )),
    );
  }

  /// 获取必填项
  static Widget buildRequireWidget(bool isRequire) {
    return Offstage(
      offstage: (!isRequire),
      child: FormUtil.getRequireIcon(isRequire),
    );
  }

  /// 获取问号
  static Widget buildTipLabelWidget(
      String? tipLabel, VoidCallback? onTip, FormItemConfig themeData) {
    return Offstage(
      offstage: (tipLabel == null),
      child: GestureDetector(
        onTap: () {
          if (onTip != null) {
            onTip();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 6, right: 7),
                child: FormUtil.getQuestionMarkIcon()),
            Container(
              child: Text(
                tipLabel ?? "",
                style: FormUtil.getTipsTextStyle(themeData),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 获取二级标题Widget
  static Widget buildTitleWidget(String title, FormItemConfig themeData) {
    return Container(
        child: Text(
      title,
      style: FormUtil.getTitleTextStyle(themeData),
    ));
  }

  /// 录入项是否可编辑
  static bool isEdit(bool isEdit) {
    return isEdit;
  }

  //
  static Widget getPrefixIcon(String type) {
    if (type == PrefixIconType.add) {
      return PhoenixTools.getAssetImageWithBandColor(BaseAsset.iconAddFormItem,
          package: 'phoenix_form');
    } else if (type == PrefixIconType.remove) {
      return PhoenixTools.getAssetImage(BaseAsset.iconRemoveFormItem,
          package: 'phoenix_form');
    } else {
      return Container();
    }
  }

  static Widget getPrefixIconWithDisable(String type, bool isEnabled) {
    return (isEnabled)
        ? FormUtil.getPrefixIcon(type)
        : ColorFiltered(
            colorFilter: ColorFilter.mode(
                BaseThemeConfig.instance.getConfig().commonConfig.colorTextHint,
                BlendMode.srcIn),
            child: FormUtil.getPrefixIcon(type),
          );
  }

  static Widget getRequireIcon(bool isRequire) {
    return Container(
      padding: isRequire
          ? const EdgeInsets.only(right: 2)
          : const EdgeInsets.only(right: 0),
      child: isRequire
          ? PhoenixTools.getAssetSizeImage(BaseAsset.iconRequireRed, 8, 8,
              color: const Color(0xFFFA3F3F), package: 'phoenix_form')
          : null,
    );
  }

  /// 视觉同学要求修改右箭头图标
  static Image getRightArrowIcon() {
    return PhoenixTools.getAssetSizeImage(
        BaseAsset.iconRightArrow, rightArrowSize, rightArrowSize,
        package: 'phoenix_form');
  }

  static Image getQuestionMarkIcon() {
    return PhoenixTools.getAssetImage(BaseAsset.iconQuestion,
        package: 'phoenix_form');
  }

  static EdgeInsets computeErrorEdgeInsets(String type, bool isRequire) {
    return const EdgeInsets.only(
      left: 20,
      top: 4,
    );
  }

  static TextInputType getInputType(String? type) {
    TextInputType inputType = TextInputType.text;

    if (type == null || type.isEmpty) {
      return inputType;
    }

    switch (type) {
      case InputType.text:
        inputType = TextInputType.text;
        break;
      case InputType.multiLine:
        inputType = TextInputType.multiline;
        break;
      case InputType.number:
        inputType = TextInputType.number;
        break;
      case InputType.decimal:
        inputType = const TextInputType.numberWithOptions(decimal: true);
        break;
      case InputType.phone:
        inputType = TextInputType.phone;
        break;
      case InputType.date:
        inputType = TextInputType.datetime;
        break;
      case InputType.email:
        inputType = TextInputType.emailAddress;
        break;
      case InputType.url:
        inputType = TextInputType.url;
        break;
      case InputType.pwd:
        inputType = TextInputType.visiblePassword;
        break;
      default:
        break;
    }

    return inputType;
  }

  ///
  /// 交互行为相关
  ///

  /// 处理点击"添加/删除"按钮动作
  static void notifyAddRemoveTap(BuildContext context, String prefixIconType,
      VoidCallback? onAddTap, VoidCallback? onRemoveTap) {
    if (PrefixIconType.add == prefixIconType) {
      if (onAddTap != null) {
        onAddTap();
      }
    } else if (PrefixIconType.remove == prefixIconType) {
      if (onRemoveTap != null) {
        onRemoveTap();
      }
    }
  }

  /// 处理点击"添加/删除"按钮动作
  static void notifyAddTap(BuildContext context, VoidCallback? onAddTap) {
    if (onAddTap != null) {
      onAddTap();
    }
  }

  /// 处理点击"添加/删除"按钮动作
  static void notifyRemoveTap(BuildContext context, VoidCallback? onRemoveTap) {
    if (onRemoveTap != null) {
      onRemoveTap();
    }
  }

  /// 处理点击"按钮"动作
  static void notifyTap(BuildContext context, VoidCallback? onWidgetTap) {
    if (onWidgetTap != null) {
      onWidgetTap();
    }
  }

  /// 处理 输入状态 变化
  static void notifyInputChanged(
      ValueChanged<String>? onTextChanged, String newStr) {
    if (onTextChanged != null) {
      onTextChanged(/*oldStr, */ newStr);
    }
  }

  /// 处理 开关 变化
  static void notifySwitchChanged(OnBrnFormSwitchChanged? onSwitchChanged,
      BuildContext context, bool oldValue, bool newValue) {
    if (onSwitchChanged != null) {
      onSwitchChanged(oldValue, newValue);
    }
  }

  /// 处理 数字值 变化
  static void notifyValueChanged(OnBrnFormValueChanged? onValueChanged,
      BuildContext context, int oldVal, int newVal) {
    if (onValueChanged != null) {
      onValueChanged(oldVal, newVal);
    }
  }

  /// 处理 单选选中状态变化
  static void notifyRadioStatusChanged(
      OnBrnFormRadioValueChanged? onTextChanged,
      BuildContext context,
      Object? oldVal,
      Object? newVal) {
    if (onTextChanged != null) {
      onTextChanged(oldVal as String?, newVal as String?);
    }
  }

  /// 处理 多选选中状态变化
  static void notifyMultiChoiceStatusChanged(
    OnBrnFormMultiChoiceValueChanged? onChoiceChanged,
    BuildContext context,
    List<String> oldVal,
    List<String> newVal,
  ) {
    if (onChoiceChanged != null) {
      onChoiceChanged(oldVal, newVal);
    }
  }

  ///
  /// 主题配置相关
  ///

  /// 选项之间的间距
  static EdgeInsets? optionsMiddlePadding(FormItemConfig themeData) {
    return themeData.optionsMiddlePadding;
  }

  /// 走主题配置 上下右间距
  static EdgeInsets itemEdgeInsets(FormItemConfig themeData) {
    return themeData.formPadding;
  }

  /// 标题行的左间距
  static EdgeInsets titleEdgeInsets(
      String type, bool isRequire, FormItemConfig themeData) {
    if (isRequire && type == PrefixIconType.normal) {
      return themeData.titlePaddingSm;
    }
    return themeData.titlePaddingLg;
  }

  /// 标题行的左间距
  static EdgeInsets titleEdgeInsetsForHead(
      bool isRequire, FormItemConfig themeData) {
    return isRequire ? themeData.titlePaddingSm : themeData.titlePaddingLg;
  }

  /// 子标题的右上间距
  static EdgeInsets subTitleEdgeInsets(FormItemConfig themeData) {
    return themeData.subTitlePadding;
  }

  /// error的右上间距
  static EdgeInsets errorEdgeInsets(FormItemConfig themeData) {
    return themeData.errorPadding;
  }

  /// 提示文本样式
  static TextStyle getTipsTextStyle(FormItemConfig themeData) {
    return themeData.tipsTextStyle.generateTextStyle();
  }

  /// 获取 右侧 输入、选择默认文本样式
  static TextStyle getHintTextStyle(FormItemConfig themeData,
      {double height = 0}) {
    if (height > 0) {
      return BaseTextStyle(height: height)
          .merge(themeData.hintTextStyle)
          .generateTextStyle();
    }
    return themeData.hintTextStyle.generateTextStyle();
  }

  /// 获取是否可编辑的字体
  static TextStyle getIsEditTextStyle(FormItemConfig themeData, bool isEdit,
      {double height = 0}) {
    if (height > 0) {
      return isEdit
          ? BaseTextStyle(height: height)
              .merge(themeData.contentTextStyle)
              .generateTextStyle()
          : BaseTextStyle(height: height)
              .merge(themeData.disableTextStyle)
              .generateTextStyle();
    }
    return isEdit
        ? themeData.contentTextStyle.generateTextStyle()
        : themeData.disableTextStyle.generateTextStyle();
  }

  /// 获取标题文本样式
  static TextStyle getTitleTextStyle(FormItemConfig themeData,
      {double height = 0}) {
    if (height > 0) {
      return BaseTextStyle(height: height)
          .merge(themeData.titleTextStyle)
          .generateTextStyle();
    }
    return themeData.titleTextStyle.generateTextStyle();
  }

  /// 获取标题文本样式
  static TextStyle getHeadTitleTextStyle(FormItemConfig themeData,
      {bool isBold = false}) {
    if (isBold) {
      return themeData.headTitleTextStyle
          .merge(BaseTextStyle(fontWeight: FontWeight.w600))
          .generateTextStyle();
    }
    return themeData.headTitleTextStyle.generateTextStyle();
  }

  /// 获取左侧辅助样式
  static TextStyle getSubTitleTextStyle(FormItemConfig themeData) {
    return themeData.subTitleTextStyle.generateTextStyle();
  }

  /// 获取error 文本样式
  static TextStyle getErrorTextStyle(FormItemConfig themeData) {
    return themeData.errorTextStyle.generateTextStyle();
  }

  /// 获取选项文本样式
  static TextStyle getOptionTextStyle(FormItemConfig themeData) {
    return themeData.optionTextStyle.generateTextStyle();
  }

  /// 获取选中选项文本样式
  static TextStyle getOptionSelectedTextStyle(FormItemConfig themeData) {
    return themeData.optionSelectedTextStyle.generateTextStyle();
  }

  ///
  /// AutoLayout
  ///

  static double rightArrowSize = 16;
  static double rightArrowLeftPadding = 10;

  /// 右边内容区域比例
  static double contentRatio = 0.6;

  /// 表单 tip 说明文字限制4个字长的最大宽度
  static double tipDescMaxWidth = 56;

  /// 当左右内容超出默认比例且「有」提示语，则按比例  6:4 布局
  /// 当左右内容超出默认比例且「无」提示语，则按比例  4:6 布局
  /// 有用户自定义比例时用用户自定义比例
  static double getAutoLayoutContentRatio(
      {required bool tipLabelHidden, double? layoutRatio}) {
    double defaultRatio =
        tipLabelHidden ? FormUtil.contentRatio : 1 - FormUtil.contentRatio;
    double contentRatio = layoutRatio != null && layoutRatio > 0
        ? 1 / (layoutRatio + 1)
        : defaultRatio;
    return contentRatio;
  }
}
