import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/utils/assets.dart';
import 'package:flutter_kit/src/shared/components/gap.dart';

@RoutePage()
class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'akabnam',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
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
                          child: const Text(
                            'Best deal',
                          )),
                    ],
                  ),
                  const Gap.horizontal(width: 14),
                  ...List.generate(
                      3,
                      (index) => Row(
                            children: [
                              Column(children: [
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
                                    child: const Text(
                                      'Best deal',
                                    ))
                              ]),
                              const Gap.horizontal(width: 14),
                            ],
                          ))
                ],
              ),
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 21),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(22)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.asset(
                    Assets.statusFullFill,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  top: 21 + 15,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                            5,
                            (index) => Container(
                                  height: 5,
                                  width: 44,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: index != 0
                                          ? Theme.of(context)
                                              .colorScheme
                                              .background
                                          : Theme.of(context)
                                              .colorScheme
                                              .inversePrimary),
                                ))
                      ],
                    ),
                  )),
              Positioned(
                bottom: 34 + 24,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CHEMISE POUR FEMMES',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ...List.generate(
                                      4,
                                      (index) => const Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          )),
                                  const Gap.horizontal(width: 8),
                                  Text('3/5',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                              fontSize: 16)),
                                ],
                              ),
                              Text('2500 FCFA',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontSize: 16))
                            ],
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.background,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary),
                              onPressed: () {},
                              child: const Text('acheter'))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
