import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:getx_mvvm/res/localization/strings.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_Us': {AppStrings.emailHint: 'Email', AppStrings.app: 'Getx MVVM'},
        'hi_In': {
          AppStrings.emailHint: 'ईमेल',
          AppStrings.app: 'गेटएक्स एमवीवीएम'
        }
      };
}
