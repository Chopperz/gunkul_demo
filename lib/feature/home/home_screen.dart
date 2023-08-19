import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide GetStringUtils;
import 'package:gunkul_demo/core/controller/home_controller.dart';
import 'package:gunkul_demo/core/extensions/string.dart';
import 'package:gunkul_demo/core/model/model.dart';
import 'package:gunkul_demo/core/widget/app_scaffold.dart';

part 'ui/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold.home(
      body: GetX<HomeController>(
        global: false,
        init: Get.put(HomeController()),
        initState: (state) => state.controller?.fetchProducts(),
        builder: (controller) {
          if (controller.status.value.isFetching || controller.status.value.isReloading) {
            return Center(
                child: CircularProgressIndicator.adaptive(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ));
          } else {
            List<ProductModel> products = controller.products.value.data;
            List<String> categories = List.of(products.map((e) => e.category ?? "-")).toSet().toList();

            if (controller.isCategoryView.value) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: categories.map((item) {
                    List<ProductModel> listOfCategory =
                        List.from(products.where((element) => element.category == item));

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.capitalize, style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 220,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return ProductCard(product: listOfCategory.elementAt(index));
                            },
                            separatorBuilder: (_, index) => const SizedBox(width: 10),
                            itemCount: listOfCategory.length,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }).toList(),
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 140 / 220,
              ),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products.elementAt(index));
              },
            );
          }
        },
      ),
    );
  }
}
