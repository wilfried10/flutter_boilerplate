import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/routing/app_router.dart';
import 'package:flutter_kit/src/shared/components/gap.dart';

@RoutePage()
class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 13),
          children: [
            Center(
              child: Text(
                'akabnam',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const Gap.vertical(height: 15),
            Center(
                child: Text(
              'S’inscrire',
              style: Theme.of(context).textTheme.titleMedium,
            )),
            const Gap.vertical(height: 38),
            Form(
                child: Column(
              children: [
                TextFormField(
                  style: Theme.of(context).textTheme.displayMedium,
                  decoration: const InputDecoration(
                    labelText: 'Nom',
                  ),
                ),
                const Gap.vertical(height: 24),
                TextFormField(
                  style: Theme.of(context).textTheme.displayMedium,
                  decoration: const InputDecoration(
                    labelText: 'Téléphone',
                  ),
                ),
                const Gap.vertical(height: 24),
                TextFormField(
                  style: Theme.of(context).textTheme.displayMedium,
                  decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                  ),
                ),
                const Gap.vertical(height: 24),
                TextFormField(
                  style: Theme.of(context).textTheme.displayMedium,
                  decoration: const InputDecoration(
                    labelText: 'Confirmer le mot de passe',
                  ),
                ),
                const Gap.vertical(height: 46),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                          value: false,
                          groupValue: 'groyp',
                          onChanged: (val) {}),
                      Expanded(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: Theme.of(context)
                                    .inputDecorationTheme
                                    .labelStyle,
                                children: [
                                  const TextSpan(text: 'J’ai lu et j’accepte'),
                                  TextSpan(
                                      text:
                                          ' les conditions utilisation d’akabnam ',
                                      style: Theme.of(context)
                                          .inputDecorationTheme
                                          .labelStyle!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary))
                                ])),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const Gap.vertical(height: 13),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 54)),
                onPressed: () {
                  context.pushRoute(const ChooseInterestCenterRoute());
                },
                child: Text('Accepter et continuer',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}
