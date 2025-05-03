import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|View,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this.ref);

  final Ref ref;

  @override
  List<AutoRoute> get routes {
    return [
      // Auth
      AutoRoute(
        path: '/auth',
        page: PageInfo.emptyShell('auth'),
        children: [
          AutoRoute(path: 'sign-in', page: SignInRoute.page),
          AutoRoute(path: 'sign-up', page: SignUpRoute.page),
        ],
      ),

      // Client
      AutoRoute(
        path: '/client',
        page: PageInfo.emptyShell('client'),
        initial: true,
        guards: [AuthMiddleware(ref)],
        children: [
          RedirectRoute(path: '', redirectTo: 'bottom-nav'),
          AutoRoute(path: 'bottom-nav', page: BottomNavRoute.page),
          AutoRoute(path: 'settings', page: SettingsRoute.page),
        ],
      ),
    ];
  }
}

final appRouterProvider = Provider(AppRouter.new);
