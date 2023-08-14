import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:getx_mvvm/res/strings/strings.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_Us': {
          AppStrings.emailHint: 'Email',
          AppStrings.app: 'Getx MVVM',
          AppStrings.internetNotConnected: "Unable to connect internet",
          AppStrings.retry: "Retry",
          AppStrings.someErrorOccured: "Some Error Occurred"
        },
        'hi_In': {
          AppStrings.emailHint: 'ईमेल',
          AppStrings.app: 'गेटएक्स एमवीवीएम',
          AppStrings.internetNotConnected: "इंटरनेट से कनेक्ट करने में असमर्थ",
          AppStrings.retry: "पुन: प्रयास करें",
          AppStrings.someErrorOccured: "कुछ त्रुटि हुई"
        }
      };
}
