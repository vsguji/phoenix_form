/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-22 11:57:11
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-22 17:36:05
 * @FilePath: /phoenix_form/lib/extension/form_default_config_utils.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';

import '../config/form_config.dart';

/// Form配置
extension BaseFormConfigUtils on BaseDefaultConfigUtils {
  /// 表单项默认配置
  static FormItemConfig defaultFormItemConfig = FormItemConfig(
    backgroundColor: Colors.white,
    headTitleTextStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBase,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeHead,
    ),
    titleTextStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBase,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
    ),
    subTitleTextStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextSecondary,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeCaption,
    ),
    errorTextStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.brandError,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeCaption,
    ),
    hintTextStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextHint,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
    ),
    contentTextStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBase,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
    ),
    optionsMiddlePadding: EdgeInsets.only(
      left: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingMd,
    ),
    optionTextStyle: BaseTextStyle(
      height: 1.3,
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextBase,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
    ),
    optionSelectedTextStyle: BaseTextStyle(
      height: 1.3,
      color: BaseDefaultConfigUtils.defaultCommonConfig.brandPrimary,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
    ),
    formPadding: EdgeInsets.only(
      left: 0.0,
      top: BaseDefaultConfigUtils.defaultCommonConfig.vSpacingLg,
      right: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingLg,
      bottom: BaseDefaultConfigUtils.defaultCommonConfig.vSpacingLg,
    ),
    titlePaddingSm: const EdgeInsets.only(left: 10),
    titlePaddingLg: EdgeInsets.only(
        left: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingLg),
    subTitlePadding: EdgeInsets.only(
      left: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingLg,
      top: BaseDefaultConfigUtils.defaultCommonConfig.vSpacingXs,
    ),
    errorPadding: EdgeInsets.only(
      left: BaseDefaultConfigUtils.defaultCommonConfig.hSpacingLg,
      top: BaseDefaultConfigUtils.defaultCommonConfig.vSpacingXs,
    ),
    disableTextStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextDisabled,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeSubHead,
    ),
    tipsTextStyle: BaseTextStyle(
      color: BaseDefaultConfigUtils.defaultCommonConfig.colorTextSecondary,
      fontSize: BaseDefaultConfigUtils.defaultCommonConfig.fontSizeBase,
    ),
  );
}
