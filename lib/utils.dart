import 'package:firebase_core/firebase_core.dart';
import 'package:skynet/services/alert_service.dart';
import 'package:skynet/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:skynet/firebase_options.dart';
import 'package:skynet/services/database_service.dart';
import 'package:skynet/services/media_service.dart';
import 'package:skynet/services/navigation_sevice.dart';
import 'package:skynet/services/storage_service.dart';

Future<void> setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> registerService() async {
  final getIt = GetIt.instance;
  getIt.registerSingleton<AuthService>(
    AuthService(),
  );
  getIt.registerSingleton<NavigationService>(
    NavigationService(),
  );
  getIt.registerSingleton<AlertService>(
    AlertService(),
  );
  getIt.registerSingleton<MediaService>(
    MediaService(),
  );
  getIt.registerSingleton<StorageService>(
    StorageService(),
  );
  getIt.registerSingleton<DatabaseService>(
    DatabaseService(),
  );
}

String generateChatId({required String uid1, required String uid2}) {
  List uids = [uid1, uid2];
  uids.sort();
  String chatId = uids.fold("", (id, uid) => "$id$uid");
  return chatId;
}
