import 'package:flutter/material.dart';






class ScavengerHuntView extends StatelessWidget {
  const ScavengerHuntView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GameBloc, GameState, GameLocation?>(
      selector: (state) => state.location,
      builder: (context, location) => BlocProvider(
        create: (context) => ScavengerHuntBloc(
          repository: context.read<ScavengerHuntRepository>(),
        )..add(ScavengerHuntLoadStarted(location)),
        child: const _View(),
      ),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScavengerHuntBloc, ScavengerHuntState>(
      builder: (context, state) => switch (state.status) {
        ScavengerHuntStatus.initial ||
        ScavengerHuntStatus.loading =>
          const ScavengerHuntLoadingView(),
        ScavengerHuntStatus.success => const ScavengerHuntLoadedView(),
        ScavengerHuntStatus.failure => const ScavengerHuntErrorView(),
        ScavengerHuntStatus.started => const ItemHuntView(),
      },
    );
  }
}