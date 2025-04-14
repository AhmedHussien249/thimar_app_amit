class ProductsData {
  late final List<ProductsModels> list;
  late final Links links;
  late final Meta meta;
  late final String status;
  late final String message;
  late final int userCartCount;
  late final int maxPrice;
  late final double minPrice;

  ProductsData.fromJson(Map<String, dynamic> json) {
    list = List.from(json['data'] ?? [])
        .map((e) => ProductsModels.fromJson(e))
        .toList();
    links = Links.fromJson(json['links'] ?? {});
    meta = Meta.fromJson(json['meta'] ?? {});
    status = json['status'] ?? "";
    message = json['message'] ?? "";
    userCartCount = json['user_cart_count'] ?? 0;
    maxPrice = json['max_price'] ?? 0;
    minPrice = json['min_price'] ?? 0;
  }
}

class ProductsModels {
  late final int categoryId;
  late final int id;
  late final String title;
  late final String description;
  late final String code;
  late final num priceBeforeDiscount;
  late final num? price;
  late final num discount;
  late final num? amount;
  late final bool isActive;
  late bool isFavorite;
  late final Unit unit;
  late final List<Images> images;
  late final String mainImage;
  late final String createdAt;

  void toggleFavorite() => isFavorite = !isFavorite;

  ProductsModels.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'] ?? 0;
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    description = json['description'] ?? "";
    code = json['code'] ?? "";
    priceBeforeDiscount = json['price_before_discount'] ?? 0;
    price = json['price'] ?? 0;
    //discount = json['discount']??0;
    //amount = json['amount']??0;
    isActive = json['is_active'] == 1;
    isFavorite = json['is_favorite'] ?? false;
    unit = Unit.fromJson(json['unit'] ?? {});
    images =
        List.from(json['images'] ?? []).map((e) => Images.fromJson(e)).toList();
    mainImage = json['main_image'] ?? "";
    createdAt = json['created_at'] ?? "";
  }
}

class Unit {
  late final int id;
  late final Null name;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = null;
    type = json['type'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
  }
}

class Images {
  late final String name;
  late final String url;

  Images.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    url = json['url'] ?? "";
  }
}

class Links {
  late final String first;
  late final String last;
  late final Null prev;
  late final Null next;

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'] ?? "";
    last = json['last'] ?? "";
    prev = null;
    next = null;
  }
}

class Meta {
  late final int currentPage;
  late final int from;
  late final int lastPage;
  late final List<Links> links;
  late final String path;
  late final int perPage;
  late final int to;
  late final int total;

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'] ?? 0;
    from = json['from'] ?? 0;
    lastPage = json['last_page'] ?? 0;
    links =
        List.from(json['links'] ?? []).map((e) => Links.fromJson(e)).toList();
    path = json['path'] ?? "";
    perPage = json['per_page'] ?? 0;
    to = json['to'] ?? 0;
    total = json['total'] ?? 0;
  }
}
