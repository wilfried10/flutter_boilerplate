import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/features/app/app_screen.dart';
import 'package:flutter_kit/src/features/app/home_screen/model/response/food_item.dart';
import 'package:flutter_kit/src/features/app/home_screen/ui/home_screen.dart';
import 'package:flutter_kit/src/features/app/home_screen/ui/product_detail_screen.dart';
import 'package:flutter_kit/src/features/app/home_screen/ui/qr_code_scanner.dart';
import 'package:flutter_kit/src/features/app/home_screen/ui/status_screen.dart';
import 'package:flutter_kit/src/features/auth/ui/choose_interest_center_screen.dart';
import 'package:flutter_kit/src/features/auth/ui/sign_up_screen.dart';
import 'package:flutter_kit/src/features/onboarding/ui/onboarding_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: SingUpRoute.page),
    AutoRoute(
      page: AppRoute.page,
    ),
    AutoRoute(page: ChooseInterestCenterRoute.page),
    AutoRoute(page: ProducDetailsRoute.page),
    AutoRoute(page: ProducDetailsRoute.page),
    AutoRoute(page: QrCodeScannerRoute.page),
    AutoRoute(page: StatusRoute.page)
  ];
}
