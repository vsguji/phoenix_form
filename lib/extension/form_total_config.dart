/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-09-22 12:00:53
import 'form_default_config_utils.dart';
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-22 17:36:02
 * @FilePath: /phoenix_form/lib/extension/form_total_config.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:phoenix_base/phoenix.dart';

import '../config/form_config.dart';
import 'form_default_config_utils.dart';

class FormTotalConfig extends BaseTotalConfig {
  FormTotalConfig({FormItemConfig? tabBarConfig})
      : _tabBarConfig = tabBarConfig;

  FormItemConfig? _tabBarConfig;

  FormItemConfig get tabBarConfig =>
      _tabBarConfig ?? BaseFormConfigUtils.defaultFormItemConfig;

  @override
  void initThemeConfig(String configId) {
    super.initThemeConfig(configId);
    _tabBarConfig ??= FormItemConfig();
    tabBarConfig.initThemeConfig(
      configId,
      currentLevelCommonConfig: commonConfig,
    );
  }
}

extension BaseTabBarTotalConfig on BaseTotalConfig {
  static FormItemConfig? _tabBarConfig;

  ///
  FormItemConfig get formItemConfig =>
      _tabBarConfig ?? BaseFormConfigUtils.defaultFormItemConfig;

  ///
  set tabBarTotalConfig(FormTotalConfig config) {
    _tabBarConfig = config.tabBarConfig;
  }
}
