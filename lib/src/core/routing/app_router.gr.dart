// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppScreen(),
      );
    },
    ChooseInterestCenterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChooseInterestCenterScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const HomeScreen()),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    ProducDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProducDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProducDetailsScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    QrCodeScannerRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QrCodeScannerScreen(),
      );
    },
    SingUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SingUpScreen(),
      );
    },
    StatusRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StatusScreen(),
      );
    },
  };
}

/// generated route for
/// [AppScreen]
class AppRoute extends PageRouteInfo<void> {
  const AppRoute({List<PageRouteInfo>? children})
      : super(
          AppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChooseInterestCenterScreen]
class ChooseInterestCenterRoute extends PageRouteInfo<void> {
  const ChooseInterestCenterRoute({List<PageRouteInfo>? children})
      : super(
          ChooseInterestCenterRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseInterestCenterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProducDetailsScreen]
class ProducDetailsRoute extends PageRouteInfo<ProducDetailsRouteArgs> {
  ProducDetailsRoute({
    Key? key,
    required FoodItem product,
    List<PageRouteInfo>? children,
  }) : super(
          ProducDetailsRoute.name,
          args: ProducDetailsRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProducDetailsRoute';

  static const PageInfo<ProducDetailsRouteArgs> page =
      PageInfo<ProducDetailsRouteArgs>(name);
}

class ProducDetailsRouteArgs {
  const ProducDetailsRouteArgs({
    this.key,
    required this.product,
  });

  final Key? key;

  final FoodItem product;

  @override
  String toString() {
    return 'ProducDetailsRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [QrCodeScannerScreen]
class QrCodeScannerRoute extends PageRouteInfo<void> {
  const QrCodeScannerRoute({List<PageRouteInfo>? children})
      : super(
          QrCodeScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrCodeScannerRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SingUpScreen]
class SingUpRoute extends PageRouteInfo<void> {
  const SingUpRoute({List<PageRouteInfo>? children})
      : super(
          SingUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SingUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StatusScreen]
class StatusRoute extends PageRouteInfo<void> {
  const StatusRoute({List<PageRouteInfo>? children})
      : super(
          StatusRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatusRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
