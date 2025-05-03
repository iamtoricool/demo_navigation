import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'package:auto_route/auto_route.dart';

export '_auth_middleware.dart';

abstract class Middleware extends AutoRouteGuard {
  final Ref ref;
  Middleware(this.ref);
}
