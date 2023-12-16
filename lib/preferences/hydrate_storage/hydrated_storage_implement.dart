import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

import 'hydrated_storage.dart';

class HydratedStoragePreferencesImplement
    implements HydratedStoragePreferences {
  HydratedStorage? _hydratedStorage;

  @override
  Future<void> clear() async {
    await _hydratedStorage?.clear();
  }

  @override
  Future<HydratedStorage> getInstance() async {
    return HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getApplicationDocumentsDirectory(),
    );
  }
}
