import 'package:flutter/material.dart';
import 'package:flutter_act15_20220324/item_hunt/bloc/item_hunt_bloc.dart';






class ItemPendingView extends StatelessWidget {
  const ItemPendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ScavengerHuntBloc, ScavengerHuntState, String>(
      selector: (state) => state.items[state.index],
      builder: (context, item) => ViewLayout(
        header: const HuntProgress(),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Next item to find:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              item,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        footer: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SkipItemButton(),
            const SizedBox(width: 8),
            FilledButton(
              onPressed: () =>
                  context.read<ItemHuntBloc>().add(ItemHuntItemFound(item)),
              child: const Text('Take photo'),
            ),
          ],
        ),
      ),
    );
  }
}