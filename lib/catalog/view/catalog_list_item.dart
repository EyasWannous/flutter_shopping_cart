import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/catalog/catalog.dart';

import 'add_button.dart';

class CatalogListItem extends StatelessWidget {
  const CatalogListItem(this.item, {super.key});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(aspectRatio: 1, child: ColoredBox(color: item.color)),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                item.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(width: 24),
            AddButton(item: item),
          ],
        ),
      ),
    );
  }
}
