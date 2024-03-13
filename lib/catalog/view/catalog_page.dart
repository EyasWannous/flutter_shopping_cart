import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/catalog/catalog.dart';

import 'catalog_app_bar.dart';
import 'catalog_list_item.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CatalogAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, state) {
              return switch (state) {
                CatalogLoading() => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                CatalogError() => const SliverFillRemaining(
                    child: Text('Something went wrong!'),
                  ),
                CatalogLoaded() => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.catalog.itemNames.length,
                      (_, index) => CatalogListItem(
                        state.catalog.getByPosition(index),
                      ),
                    ),
                  ),
              };
            },
          ),
        ],
      ),
    );
  }
}
