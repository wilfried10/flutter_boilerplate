import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/routing/app_router.dart';
import 'package:flutter_kit/src/shared/components/gap.dart';

@RoutePage()
class ChooseInterestCenterScreen extends StatefulWidget {
  const ChooseInterestCenterScreen({super.key});

  @override
  State<ChooseInterestCenterScreen> createState() =>
      _ChooseInterestCenterScreenState();
}

class _ChooseInterestCenterScreenState
    extends State<ChooseInterestCenterScreen> {
  List<String> interests = [
    'Restaurant',
    'education',
    'Sport',
    'tech',
    'Santé',
    'promotion',
    'Shopping',
    'Beauté et bien être'
  ];

  List<String> selectedChoices = [];
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
              'Choisir tes centres intérêts',
              style: Theme.of(context).textTheme.titleMedium,
            )),
            const Gap.vertical(height: 64),
            Wrap(children: interests.map((e) => item(value: e)).toList()),
            const Gap.vertical(height: 111),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: selectedChoices.isNotEmpty
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.outlineVariant,
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 54)),
                onPressed: () {
                  context.pushRoute(const AppRoute());
                },
                child: Text('Continuer',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: selectedChoices.isNotEmpty
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.onSurfaceVariant))),
          ],
        ),
      ),
    );
  }

  Widget item({required String value}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 15),
      child: GestureDetector(
        onTap: () {
          if (selectedChoices.contains(value)) {
            selectedChoices.remove(value);
          } else {
            selectedChoices.add(value);
          }
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: selectedChoices.contains(value)
                ? Theme.of(context).colorScheme.secondary
                : null,
            border: Border.all(
              width: 2,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 27),
              child: Text(
                value,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
