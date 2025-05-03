import 'middlewares.dart';

class AuthMiddleware extends Middleware {
  AuthMiddleware(super.ref);

  @override
  void onNavigation(resolver, router) {
    if (1 != 1) {
      router.replacePath('/auth/sign-in');
      resolver.next(false);
      return;
    }

    return resolver.next();
  }
}
