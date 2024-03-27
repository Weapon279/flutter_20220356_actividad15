import 'package:flutter/material.dart';
import 'package:flutter_act15_20220324/game/bloc/game_bloc.dart';
import 'package:flutter_act15_20220324/game/bloc/game_state.dart';

import '../../game/bloc/game_state.dart';







class HuntProgress extends StatelessWidget {
  const HuntProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScavengerHuntBloc, ScavengerHuntState>(
      builder: (context, state) {
        final ScavengerHuntState(items: items, index: index) = state;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Items left: ${items.length - index}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            BlocSelector<GameBloc, GameState, int>(
              selector: (state) => state.score,
              builder: (context, score) => Text(
                '$score/${items.length * 100}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        );
      },
    );
  }
}