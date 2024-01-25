import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../core/api/api_client.dart';
import '../core/repositories/post/post_repository.dart';
import '../view_model/post_view_model.dart';

final locator = GetIt.I;

void setup() {
  // ================ BLoC / Cubit ================ //

  locator.registerLazySingleton(() => PostViewModel(locator()));

  // ================ Repository / Datasource ================ //

  locator.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(locator()));

  // ================ Core ================ //

  locator.registerLazySingleton<ApiClient>(() => ApiClientImpl(locator()));
  locator.registerLazySingleton<Client>(() => Client());

  // ================ External ================ //
}
