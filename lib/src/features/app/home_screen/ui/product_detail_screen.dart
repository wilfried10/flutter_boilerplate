import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/utils/assets.dart';
import 'package:flutter_kit/src/core/utils/filled_star.dart';
import 'package:flutter_kit/src/features/app/home_screen/model/response/food_item.dart';
import 'package:flutter_kit/src/shared/components/gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

@RoutePage()
class ProducDetailsScreen extends StatefulWidget {
  final FoodItem product;
  const ProducDetailsScreen({super.key, required this.product});

  @override
  State<ProducDetailsScreen> createState() => _ProducDetailsScreenState();
}

class _ProducDetailsScreenState extends State<ProducDetailsScreen> {
  String activeImage = Assets.statusImgTest6;

  List<String> images = [
    Assets.statusImgTest4,
    Assets.statusImgTest3,
    Assets.statusImgTest5,
    Assets.statusImgTest6,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20)),
            alignment: Alignment.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2.2,
            child: Image.asset(
              activeImage,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Wrap(
                  children: [
                    ...images.map((e) => Container(
                          margin: const EdgeInsets.only(top: 11, right: 9),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).colorScheme.surface),
                          height: 53,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                activeImage = e;
                              });
                            },
                            child: Image.asset(e),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 13, top: 11),
                height: 26,
                padding: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.primary),
                child: Text(
                  'akabnam',
                  style: TextStyle(
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              const Gap.horizontal(width: 4),
              Expanded(
                child: Text(
                  'akabnam',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              ...List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )),
              const Gap.horizontal(width: 56)
            ],
          ),
          const Gap.vertical(
            height: 11,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => Dialog(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                width: double.infinity,
                                height: 300,
                                child: SfBarcodeGenerator(
                                  value: widget.product.name,
                                  symbology: QRCode(),
                                ),
                              ),
                            ));
                  },
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  '${widget.product.price} FCFA',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Text('Taxe locale incluse si applicable'),
                const Divider(),
                Text('Condition de vente',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 15)),
                const Text(
                    'L’un meilleur berger de la ville de yaoundé déguster les meilleur saveur du pays'),
                const Divider(),
                Text('Description',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 15)),
                const Text(
                    'L’un meilleur berger de la ville de yaoundé déguster les meilleur saveur du pays'),
                const Gap.vertical(
                  height: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        minimumSize: const Size.fromHeight(40)),
                    onPressed: () {},
                    child: Text(
                      'Acheter',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.background),
                    )),
              ],
            ),
          ),
          const Gap.vertical(
            height: 30,
          ),
        ],
      ),
    );
  }
}
