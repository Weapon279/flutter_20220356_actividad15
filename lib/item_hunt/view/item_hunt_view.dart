import 'package:flutter/material.dart';
import 'package:flutter_act15_20220324/item_hunt/bloc/item_hunt_bloc.dart';






class ItemHuntView extends StatelessWidget {
  const ItemHuntView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemHuntBloc(
        photoPicker: context.read<PhotoPicker>(),
        repository: context.read<ScavengerHuntRepository>(),
      )..add(const ItemHuntReset()),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ItemHuntBloc, ItemHuntState, ItemHuntStatus>(
      selector: (state) => state.status,
      builder: (context, status) => switch (status) {
        ItemHuntStatus.initial => const ItemPendingView(),
        ItemHuntStatus.validationInProgress => const ItemValidatingView(),
        ItemHuntStatus.validationSuccess => const ItemValidationSuccessView(),
        ItemHuntStatus.validationFailure => const ItemValidationFailureView(),
      },
    );
  }
}