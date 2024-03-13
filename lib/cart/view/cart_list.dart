import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/cart/cart.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return switch (state) {
          CartLoading() => const CircularProgressIndicator.adaptive(),
          CartError() => const Text('Something went wrong!'),
          CartLoaded() => ListView.separated(
              itemCount: state.cart.items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final item = state.cart.items[index];
                return Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: ListTile(
                    leading: const Icon(Icons.done),
                    title: Text(
                      item.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    onLongPress: () {
                      context.read<CartBloc>().add(CartItemRemoved(item));
                    },
                  ),
                );
              },
            ),
        };
      },
    );
  }
}
