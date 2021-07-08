import 'package:flutter/cupertino.dart';
import 'package:places/src/api/auth_api.dart';
import 'package:places/src/services/auth/auth_service.dart';
import 'package:places/src/services/auth_rx_provider.dart';
import 'package:places/src/services/local/cache_provider.dart';
import 'package:places/src/services/local/db_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// provider are of two types
/// 1. Independent provider
/// 2. Dependent provider
/// 3. Stream Provider

final List<SingleChildWidget> providers = [
  ...independentProviders,
  ...dependentProviders
];

final List<SingleChildWidget> independentProviders = [
  Provider.value(value: AuthApi()),
  Provider.value(value: DbProvider()),
  Provider.value(value: CacheProvider()),
  Provider.value(value: AuthRxProvider()),
];

final List<SingleChildWidget> dependentProviders = [
  ProxyProvider4<AuthApi, DbProvider, CacheProvider, AuthRxProvider, AuthService>(update:
      (BuildContext context, AuthApi api, DbProvider dbProvider,
      CacheProvider cacheProvider, AuthRxProvider authRxProvider, AuthService? authService) {
    return authService ?? AuthService(dbProvider, cacheProvider, api,authRxProvider);
  }),
];