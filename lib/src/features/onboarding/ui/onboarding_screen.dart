import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/routing/app_router.dart';
import 'package:flutter_kit/src/core/utils/assets.dart';
import 'package:flutter_kit/src/shared/components/gap.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(children: [
        SafeArea(
          child: Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text('Langue',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        const Gap.vertical(height: 67),
        Text(
          'akabnam',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Gap.vertical(height: 56),
        Padding(
            padding: const EdgeInsets.only(left: 60, right: 36),
            child: SvgPicture.asset(Assets.onboarding)),
        const Gap.vertical(height: 6.5),
        Padding(
            padding: const EdgeInsets.only(left: 38, right: 42),
            child: Text(
              'Avez un business ou un idée de business',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.background),
            )),
        const Gap.vertical(height: 21),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 54)),
            onPressed: () {
              context.pushRoute(const SingUpRoute());
            },
            child: Text('Créer votre compte',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold))),
        const Gap.vertical(height: 36),
        Text(
          'Vous n’avez de comptes ?',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.background,
              fontWeight: FontWeight.w700),
        )
      ]),
    );
  }
}
