import 'package:flutter_practise/page/getit/res/dio_user_repo.dart';
import 'package:get_it/get_it.dart';

class FactoryManager {
  static DioUserRepo provideDioUserRepo() => GetIt.I.get<DioUserRepo>();
}
