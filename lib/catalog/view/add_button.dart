import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/cart/cart.dart';
import 'package:flutter_shopping_cart/catalog/catalog.dart';

class AddButton extends StatelessWidget {
  const AddButton({required this.item, super.key});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return switch (state) {
          CartLoading() => const CircularProgressIndicator(),
          CartError() => const Text('Something went wrong!'),
          CartLoaded() => Builder(
              builder: (context) {
                final isInCart = state.cart.items.contains(item);
                return TextButton(
                  style: TextButton.styleFrom(
                    disabledForegroundColor: theme.primaryColor,
                  ),
                  onPressed: isInCart
                      ? null
                      : () => context.read<CartBloc>().add(CartItemAdded(item)),
                  child: isInCart
                      ? const Icon(Icons.check, semanticLabel: 'ADDED')
                      : const Text('ADD'),
                );
              },
            )
        };
      },
    );
  }
}
