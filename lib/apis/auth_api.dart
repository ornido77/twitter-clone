import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/core/providers.dart';

final authAPIProvider = Provider((ref) {
  return AuthAPI(account: ref.watch(appwriteAccountProvider));
});

abstract class IAuthAPI {
  FutureEither<User> signUp({
    required String email,
    required String password,
  });
  FutureEither<Session> logIn({
    required String email,
    required String password,
  });

  Future<User?> currentUserAccount();
}

class AuthAPI extends IAuthAPI {
  final Account _account;

  AuthAPI({required Account account}) : _account = account;

  @override
  Future<User?> currentUserAccount() async {
    try {
      return await _account.get();
    } on AppwriteException {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  FutureEither<User> signUp(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occured',
          stackTrace,
        ),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  @override
  FutureEither<Session> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final session = await _account.createEmailSession(
        email: email,
        password: password,
      );
      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occured',
          stackTrace,
        ),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }
}
