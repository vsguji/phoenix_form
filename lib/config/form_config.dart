import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_form/extension/form_total_config.dart';

import '../extension/form_default_config_utils.dart';

/// 描述: form 表单项主配置类
class FormItemConfig extends BaseConfig {
  /// 遵循全局配置
  /// 默认为 [BrnDefaultConfigUtils.defaultFormItemConfig]
  FormItemConfig({
    Color? backgroundColor,
    BaseTextStyle? titleTextStyle,
    BaseTextStyle? subTitleTextStyle,
    BaseTextStyle? errorTextStyle,
    BaseTextStyle? hintTextStyle,
    BaseTextStyle? contentTextStyle,
    EdgeInsets? formPadding,
    EdgeInsets? titlePaddingSm,
    EdgeInsets? titlePaddingLg,
    EdgeInsets? optionsMiddlePadding,
    EdgeInsets? subTitlePadding,
    EdgeInsets? errorPadding,
    BaseTextStyle? disableTextStyle,
    BaseTextStyle? tipsTextStyle,
    BaseTextStyle? headTitleTextStyle,
    BaseTextStyle? optionTextStyle,
    BaseTextStyle? optionSelectedTextStyle,
    String configId = GLOBAL_CONFIG_ID,
  })  : _backgroundColor = backgroundColor,
        _titleTextStyle = titleTextStyle,
        _subTitleTextStyle = subTitleTextStyle,
        _errorTextStyle = errorTextStyle,
        _hintTextStyle = hintTextStyle,
        _contentTextStyle = contentTextStyle,
        _formPadding = formPadding,
        _titlePaddingSm = titlePaddingSm,
        _titlePaddingLg = titlePaddingLg,
        _optionsMiddlePadding = optionsMiddlePadding,
        _subTitlePadding = subTitlePadding,
        _errorPadding = errorPadding,
        _disableTextStyle = disableTextStyle,
        _tipsTextStyle = tipsTextStyle,
        _headTitleTextStyle = headTitleTextStyle,
        _optionTextStyle = optionTextStyle,
        _optionSelectedTextStyle = optionSelectedTextStyle,
        super(configId: configId);

  FormItemConfig.generatorFromConfigId(String configId) {
    initThemeConfig(configId);
  }

  /// 表单项整体背景色
  /// default color is Colors.White
  Color? _backgroundColor;

  /// 左侧标题文本样式
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.colorTextBase],
  ///   fontSize: [BrnCommonConfig.fontSizeHead],
  /// )
  BaseTextStyle? _headTitleTextStyle;

  /// 左侧标题文本样式
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.colorTextBase],
  ///   fontSize: [BrnCommonConfig.fontSizeSubHead],
  /// )
  BaseTextStyle? _titleTextStyle;

  /// 左侧辅助文本样式
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.colorTextSecondary],
  ///   fontSize: [BrnCommonConfig.fontSizeCaption],
  /// )
  BaseTextStyle? _subTitleTextStyle;

  /// 左侧 Error 文本样式
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.brandError],
  ///   fontSize: [BrnCommonConfig.fontSizeCaption],
  /// )
  BaseTextStyle? _errorTextStyle;

  /// 右侧 输入、选择提示文本样式
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.colorTextHint],
  ///   fontSize: [BrnCommonConfig.fontSizeSubHead],
  /// )
  BaseTextStyle? _hintTextStyle;

  /// 右侧 主要内容样式
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.colorTextBase],
  ///   fontSize: [BrnCommonConfig.fontSizeSubHead],
  /// )
  BaseTextStyle? _contentTextStyle;

  /// 表单项 当有星号标识 上下右边距
  ///
  /// EdgeInsets.only(
  ///   left: 0,
  ///   top: [BrnCommonConfig.vSpacingLg],
  ///   right: [BrnCommonConfig.hSpacingLg],
  ///   bottom: [BrnCommonConfig.vSpacingLg],
  /// )
  EdgeInsets? _formPadding;

  /// 表单项 当有星号标识 左边距
  ///
  /// EdgeInsets.only(left: 10)
  EdgeInsets? _titlePaddingSm;

  /// 表单项 当无星号标识 左右边距
  ///
  /// EdgeInsets.only(left: [BrnCommonConfig.hSpacingLg])
  EdgeInsets? _titlePaddingLg;

  /// 选项之间间距 单选 or 多选
  ///
  /// EdgeInsets.only(left: [BrnCommonConfig.hSpacingMd])
  EdgeInsets? _optionsMiddlePadding;

  /// 选项普通文本样式
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.colorTextBase],
  ///   fontSize: [BrnCommonConfig.fontSizeSubHead],
  ///   height: 1.3,
  /// )
  BaseTextStyle? _optionTextStyle;

  /// 选项选中文本样式
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.brandPrimary],
  ///   fontSize: [BrnCommonConfig.fontSizeSubHead],
  ///   height: 1.3,
  /// )
  BaseTextStyle? _optionSelectedTextStyle;

  /// 子标题 左上间距
  ///
  /// EdgeInsets.only(
  ///   left: [BrnCommonConfig.hSpacingLg],
  ///   top: [BrnCommonConfig.vSpacingXs],
  /// )
  EdgeInsets? _subTitlePadding;

  /// error提示 左上间距
  ///
  /// EdgeInsets.only(
  ///   left: [BrnCommonConfig.hSpacingLg],
  ///   top: [BrnCommonConfig.vSpacingXs],
  /// )
  EdgeInsets? _errorPadding;

  /// 不可修改内容展示
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.colorTextDisabled],
  ///   fontSize: [BrnCommonConfig.fontSizeSubHead],
  /// )
  BaseTextStyle? _disableTextStyle;

  /// 提示文本样式
  ///
  /// BrnTextStyle(
  ///   color: [BrnCommonConfig.colorTextSecondary],
  ///   fontSize: [BrnCommonConfig.fontSizeBase],
  /// )
  BaseTextStyle? _tipsTextStyle;

  Color get backgroundColor =>
      _backgroundColor ??
      BaseFormConfigUtils.defaultFormItemConfig.backgroundColor;

  BaseTextStyle get headTitleTextStyle =>
      _headTitleTextStyle ??
      BaseFormConfigUtils.defaultFormItemConfig.headTitleTextStyle;

  BaseTextStyle get titleTextStyle =>
      _titleTextStyle ??
      BaseFormConfigUtils.defaultFormItemConfig.titleTextStyle;

  BaseTextStyle get subTitleTextStyle =>
      _subTitleTextStyle ??
      BaseFormConfigUtils.defaultFormItemConfig.subTitleTextStyle;

  BaseTextStyle get errorTextStyle =>
      _errorTextStyle ??
      BaseFormConfigUtils.defaultFormItemConfig.errorTextStyle;

  BaseTextStyle get hintTextStyle =>
      _hintTextStyle ?? BaseFormConfigUtils.defaultFormItemConfig.hintTextStyle;

  BaseTextStyle get contentTextStyle =>
      _contentTextStyle ??
      BaseFormConfigUtils.defaultFormItemConfig.contentTextStyle;

  EdgeInsets get formPadding =>
      _formPadding ?? BaseFormConfigUtils.defaultFormItemConfig.formPadding;

  EdgeInsets get titlePaddingSm =>
      _titlePaddingSm ??
      BaseFormConfigUtils.defaultFormItemConfig.titlePaddingSm;

  EdgeInsets get titlePaddingLg =>
      _titlePaddingLg ??
      BaseFormConfigUtils.defaultFormItemConfig.titlePaddingLg;

  EdgeInsets get optionsMiddlePadding =>
      _optionsMiddlePadding ??
      BaseFormConfigUtils.defaultFormItemConfig.optionsMiddlePadding;

  BaseTextStyle get optionTextStyle =>
      _optionTextStyle ??
      BaseFormConfigUtils.defaultFormItemConfig.optionTextStyle;

  BaseTextStyle get optionSelectedTextStyle =>
      _optionSelectedTextStyle ??
      BaseFormConfigUtils.defaultFormItemConfig.optionSelectedTextStyle;

  EdgeInsets get subTitlePadding =>
      _subTitlePadding ??
      BaseFormConfigUtils.defaultFormItemConfig.subTitlePadding;

  EdgeInsets get errorPadding =>
      _errorPadding ?? BaseFormConfigUtils.defaultFormItemConfig.errorPadding;

  BaseTextStyle get disableTextStyle =>
      _disableTextStyle ??
      BaseFormConfigUtils.defaultFormItemConfig.disableTextStyle;

  BaseTextStyle get tipsTextStyle =>
      _tipsTextStyle ?? BaseFormConfigUtils.defaultFormItemConfig.tipsTextStyle;

  /// 举例：
  /// ① 尝试获取最近的配置 [topRadius] 若配不为 null，直接使用该配置.
  /// ② [topRadius] 若为 null，尝试使用 全局配置中的配置 BrnFormItemConfig.
  /// ③ 如果全局配置中的配置同样为 null 则根据 [configId] 取出全局配置。
  /// ④ 如果没有配置 [configId] 的全局配置，则使用 Bruno 默认的配置
  @override
  void initThemeConfig(
    String configId, {
    BaseCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    /// 用户全局form组件配置
    FormItemConfig formItemThemeData =
        BaseThemeConfig.instance.getConfig(configId: configId).formItemConfig;

    _backgroundColor ??= formItemThemeData.backgroundColor;
    _titlePaddingSm ??= formItemThemeData.titlePaddingSm;
    _titlePaddingLg ??= formItemThemeData.titlePaddingLg;
    _optionSelectedTextStyle = formItemThemeData.optionSelectedTextStyle.merge(
      BaseTextStyle(
        color: commonConfig.brandPrimary,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_optionSelectedTextStyle),
    );
    _optionTextStyle = formItemThemeData.optionTextStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_optionTextStyle),
    );
    _headTitleTextStyle = formItemThemeData.headTitleTextStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeHead,
      ).merge(_headTitleTextStyle),
    );
    _errorPadding ??= EdgeInsets.only(
      left: commonConfig.hSpacingLg,
      right: formItemThemeData.errorPadding.right,
      top: commonConfig.vSpacingXs,
      bottom: formItemThemeData.errorPadding.bottom,
    );
    _subTitlePadding ??= EdgeInsets.only(
      left: commonConfig.hSpacingLg,
      right: formItemThemeData.subTitlePadding.right,
      top: commonConfig.vSpacingXs,
      bottom: formItemThemeData.subTitlePadding.bottom,
    );
    _formPadding ??= EdgeInsets.only(
      left: formItemThemeData.formPadding.left,
      right: commonConfig.hSpacingLg,
      top: commonConfig.vSpacingLg,
      bottom: commonConfig.vSpacingLg,
    );
    _tipsTextStyle = formItemThemeData.tipsTextStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextSecondary,
        fontSize: commonConfig.fontSizeBase,
      ).merge(_tipsTextStyle),
    );
    _disableTextStyle = formItemThemeData.disableTextStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextDisabled,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_disableTextStyle),
    );
    _contentTextStyle = formItemThemeData.contentTextStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_contentTextStyle),
    );
    _hintTextStyle = formItemThemeData.hintTextStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextHint,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_hintTextStyle),
    );
    _titleTextStyle = formItemThemeData.titleTextStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextBase,
        fontSize: commonConfig.fontSizeSubHead,
      ).merge(_titleTextStyle),
    );
    _subTitleTextStyle = formItemThemeData.subTitleTextStyle.merge(
      BaseTextStyle(
        color: commonConfig.colorTextSecondary,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_subTitleTextStyle),
    );
    _errorTextStyle = formItemThemeData.errorTextStyle.merge(
      BaseTextStyle(
        color: commonConfig.brandError,
        fontSize: commonConfig.fontSizeCaption,
      ).merge(_errorTextStyle),
    );
    _optionsMiddlePadding ??= formItemThemeData.optionsMiddlePadding;
  }

  FormItemConfig copyWith({
    Color? backgroundColor,
    BaseTextStyle? titleTextStyle,
    BaseTextStyle? subTitleTextStyle,
    BaseTextStyle? errorTextStyle,
    BaseTextStyle? hintTextStyle,
    BaseTextStyle? contentTextStyle,
    EdgeInsets? formPadding,
    EdgeInsets? titlePaddingSm,
    EdgeInsets? titlePaddingLg,
    EdgeInsets? optionsMiddlePadding,
    EdgeInsets? subTitlePadding,
    EdgeInsets? errorPadding,
    BaseTextStyle? disableTextStyle,
    BaseTextStyle? tipsTextStyle,
    BaseTextStyle? headTitleTextStyle,
    BaseTextStyle? optionTextStyle,
    BaseTextStyle? optionSelectedTextStyle,
  }) {
    return FormItemConfig(
      backgroundColor: backgroundColor ?? _backgroundColor,
      titleTextStyle: titleTextStyle ?? _titleTextStyle,
      subTitleTextStyle: subTitleTextStyle ?? _subTitleTextStyle,
      errorTextStyle: errorTextStyle ?? _errorTextStyle,
      hintTextStyle: hintTextStyle ?? _hintTextStyle,
      contentTextStyle: contentTextStyle ?? _contentTextStyle,
      formPadding: formPadding ?? _formPadding,
      titlePaddingSm: titlePaddingSm ?? _titlePaddingSm,
      titlePaddingLg: titlePaddingLg ?? _titlePaddingLg,
      optionsMiddlePadding: optionsMiddlePadding ?? _optionsMiddlePadding,
      subTitlePadding: subTitlePadding ?? _subTitlePadding,
      errorPadding: errorPadding ?? _errorPadding,
      disableTextStyle: disableTextStyle ?? _disableTextStyle,
      tipsTextStyle: tipsTextStyle ?? _tipsTextStyle,
      headTitleTextStyle: headTitleTextStyle ?? _headTitleTextStyle,
      optionTextStyle: optionTextStyle ?? _optionTextStyle,
      optionSelectedTextStyle:
          optionSelectedTextStyle ?? _optionSelectedTextStyle,
    );
  }

  FormItemConfig merge(FormItemConfig? other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other._backgroundColor,
      titleTextStyle: titleTextStyle.merge(other._titleTextStyle),
      subTitleTextStyle: subTitleTextStyle.merge(other._subTitleTextStyle),
      errorTextStyle: errorTextStyle.merge(other._errorTextStyle),
      hintTextStyle: hintTextStyle.merge(other._hintTextStyle),
      contentTextStyle: contentTextStyle.merge(other._contentTextStyle),
      formPadding: other._formPadding,
      titlePaddingSm: other._titlePaddingSm,
      titlePaddingLg: other._titlePaddingLg,
      optionsMiddlePadding: other._optionsMiddlePadding,
      subTitlePadding: other._subTitlePadding,
      errorPadding: other._errorPadding,
      disableTextStyle: disableTextStyle.merge(other._disableTextStyle),
      tipsTextStyle: tipsTextStyle.merge(other._tipsTextStyle),
      headTitleTextStyle: headTitleTextStyle.merge(other._headTitleTextStyle),
      optionTextStyle: optionTextStyle.merge(other._optionTextStyle),
      optionSelectedTextStyle:
          optionSelectedTextStyle.merge(other._optionSelectedTextStyle),
    );
  }
}
