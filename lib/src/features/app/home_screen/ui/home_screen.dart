import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kit/src/core/routing/app_router.dart';
import 'package:flutter_kit/src/core/utils/assets.dart';
import 'package:flutter_kit/src/features/app/home_screen/logic/counter_cubit.dart';
import 'package:flutter_kit/src/features/app/home_screen/model/mocks/food_item_mocks.dart';
import 'package:flutter_kit/src/shared/components/gap.dart';

@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => CounterCubit(),
        child: this,
      );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 90 + 21,
          leading: Container(
            margin: const EdgeInsets.only(left: 21),
            alignment: Alignment.center,
            child: Text(
              'akabnam',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 20),
            ),
          ),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6)),
                onPressed: () {},
                child: Text(
                  'vendre votre produit',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.background),
                )),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline))
          ],
          bottom: AppBar(
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              title: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 16),
                        decoration: const InputDecoration(
                            hintText: 'Rechercher',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 11, horizontal: 24),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.tune,
                        color: Theme.of(context).colorScheme.secondary,
                      ))
                ],
              )),
        ),
        body: ListView(
          children: [
            const Gap.vertical(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant),
              child: Column(
                children: [
                  Text(
                    'Bienvenue sur akabnam',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 16),
                  ),
                  const Text(
                    'Découvrez des produits ecceptionnels',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            const Gap.vertical(height: 14),
            Padding(
              padding: const EdgeInsets.only(left: 39),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  width: 2)),
                          child: Image.asset(Assets.statusImgTest),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 2),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'Best deal',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.background),
                            )),
                      ],
                    ),
                    const Gap.horizontal(width: 14),
                    ...List.generate(
                        3,
                        (index) => Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.pushRoute(const StatusRoute());
                                  },
                                  child: Column(children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary,
                                              width: 2)),
                                      child: Image.asset(index == 1
                                          ? Assets.statusImgTest1
                                          : Assets.statusImgTest2),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(top: 2),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 3),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surfaceVariant,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: const Text(
                                          'Best deal',
                                        ))
                                  ]),
                                ),
                                const Gap.horizontal(width: 14),
                              ],
                            ))
                  ],
                ),
              ),
            ),
            const Gap.vertical(height: 11),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 48,
                    crossAxisCount: 2,
                    childAspectRatio:
                        MediaQuery.of(context).size.aspectRatio + .35),
                itemCount: foodItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      context.pushRoute(
                          ProducDetailsRoute(product: foodItems[index]));
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            constraints: const BoxConstraints(maxHeight: 100),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(17)),
                            child: Image.asset(index % 3 == 0
                                ? Assets.statusImgTest4
                                : index % 2 == 0
                                    ? Assets.statusImgTest3
                                    : index % 3 == 0
                                        ? Assets.statusImgTest4
                                        : Assets.statusImgTest5),
                          ),
                          const Gap.vertical(height: 4),
                          Text(
                            foodItems[index].name,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  size: 16,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                              const Gap.horizontal(width: 6),
                              Text(
                                '${foodItems[index].rating} excellent',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary),
                              ),
                            ],
                          ),
                          Text('${foodItems[index].price} FCFA'),
                        ]),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
