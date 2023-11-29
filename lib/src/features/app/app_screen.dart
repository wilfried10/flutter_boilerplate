import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/routing/app_router.dart';
import 'package:flutter_kit/src/core/utils/assets.dart';
import 'package:flutter_kit/src/features/app/chat/ui/chat_screen.dart';
import 'package:flutter_kit/src/features/app/home_screen/ui/home_screen.dart';
import 'package:flutter_kit/src/shared/components/gap.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomeScreen(),
        Container(),
        const ChatScreen(),
      ][_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            if (index == 1) {
              showModalBottomSheet(
                  context: context, builder: (_) => const AppWidget());
              return;
            }
            setState(() {
              _selectedItem = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.iconHome,
                    colorFilter: _selectedItem != 0
                        ? null
                        : ColorFilter.mode(
                            Theme.of(context).colorScheme.secondary,
                            BlendMode.srcIn)),
                label: 'home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.iconApp,
                    colorFilter: _selectedItem != 1
                        ? null
                        : ColorFilter.mode(
                            Theme.of(context).colorScheme.secondary,
                            BlendMode.srcIn)),
                label: 'app'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.iconMessage,
                    colorFilter: _selectedItem != 2
                        ? null
                        : ColorFilter.mode(
                            Theme.of(context).colorScheme.secondary,
                            BlendMode.srcIn)),
                label: 'message'),
          ]),
    );
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width / 13,
              child: Divider(
                thickness: 2,
                color: Theme.of(context).colorScheme.inversePrimary,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appItem(context, title: 'Pay'),
                    appItem(context,
                        title: 'billet',
                        bg: Theme.of(context).colorScheme.tertiary,
                        foreignColor: Theme.of(context).colorScheme.onTertiary),
                    appItem(context,
                        title: 'livraison',
                        bg: Theme.of(context).colorScheme.inversePrimary,
                        foreignColor: Theme.of(context).colorScheme.background),
                  ],
                ),
                const Gap.vertical(
                  height: 24,
                ),
                InkWell(
                  onTap: () {
                    context.pushRoute(const QrCodeScannerRoute());
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 64,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.scrim,
                            borderRadius: BorderRadius.circular(17)),
                        child: const Icon(Icons.qr_code),
                      ),
                      const Gap.vertical(height: 8),
                      const Text('Qr-code',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appItem(BuildContext context,
      {required String title, Color? bg, Color? foreignColor}) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 64,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: bg ?? Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(17)),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w900,
                color: foreignColor ?? Theme.of(context).colorScheme.secondary),
          ),
        ),
        const Gap.vertical(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        )
      ],
    );
  }
}
