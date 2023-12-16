import 'package:hydrated_bloc/hydrated_bloc.dart';

abstract class HydratedStoragePreferences {
  Future<HydratedStorage> getInstance();
  Future<void> clear();
}
