import 'package:get/get.dart' hide Response;
import 'package:gunkul_demo/core/api/path.dart';
import 'package:gunkul_demo/core/model/model.dart';
import 'package:gunkul_demo/core/service/dio_service.dart';

enum HomeStatus { init, fetching, reloading, done, error }

extension HomeStatusX on HomeStatus {
  bool get isInit => this == HomeStatus.init;

  bool get isFetching => this == HomeStatus.fetching;

  bool get isReloading => this == HomeStatus.reloading;

  bool get isDone => this == HomeStatus.done;

  bool get isError => this == HomeStatus.error;
}

class HomeController extends GetxController {
  Rx<Paginate<ProductModel>> products = Paginate<ProductModel>().obs;
  Rx<HomeStatus> status = HomeStatus.init.obs;
  Rx<bool> isCategoryView = false.obs;

  Future<void> fetchProducts({bool isRefresh = false}) async {
    if (products.value.data.isEmpty) {
      status.value = HomeStatus.fetching;
    } else if (isRefresh) {
      status.value = HomeStatus.reloading;
    }

    Response response = await DioService.instance.get(path: ApiPath.all_products.path);
    if (response.data["products"] != null) {
      final productJson = response.data["products"] as List;
      products.value = Paginate.fromJson(
        response.data,
        cast: List.from(productJson.map((e) => ProductModel.fromJson(e))),
      );
    }
    status.value = HomeStatus.done;
  }

  void onToggleView() {
    isCategoryView.value = !isCategoryView.value;
  }
}
