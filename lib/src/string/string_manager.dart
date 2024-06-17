import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_practise/presentation/navigation/navigation_manager.dart';

class StringsApp {
  static AppLocalizations? getLocalization() {
    if (NavigationApp.navigatorKey.currentContext != null) {
      return AppLocalizations.of(NavigationApp.navigatorKey.currentContext!);
    }
    return null;
  }

  static String replaceValue = '#value#';

  static String get gridview => getLocalization()?.gridview ?? '';
}
