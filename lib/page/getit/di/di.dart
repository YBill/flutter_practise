import 'package:flutter_practise/page/getit/res/dio_user_repo.dart';
import 'package:flutter_practise/page/getit/res/dio_user_repo_impl.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

void initModule() {
  //DIO REPO
  _initDio();
}

void _initDio() {
  //DIO REPOs - REST APIs
  instance.registerLazySingleton<DioUserRepo>(() {
    return DioUserRepoImpl();
  });
}
