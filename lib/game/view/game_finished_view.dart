import 'package:flutter/material.dart';
import 'package:flutter_act15_20220324/game/bloc/game_bloc.dart';


import '../bloc/game_state.dart';



class GameFinishedView extends StatelessWidget {
  const GameFinishedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GameBloc, GameState, int>(
      selector: (state) => state.score,
      builder: (context, score) => ViewLayout(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🤠', style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 16),
            Text(
              'The hunt is over!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 32),
            Text(
              'Your score: $score',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        footer: FilledButton(
          onPressed: () => context.read<GameBloc>().add(const GameReset()),
          child: const Text('Play again'),
        ),
      ),
    );
  }
}