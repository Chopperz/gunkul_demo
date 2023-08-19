enum ApiPath {
  login,
  all_users,
  all_products,
}

extension ApiPathExtension on ApiPath {
  String get path {
    switch(this) {
      case ApiPath.login:
      return "auth/login";
      case ApiPath.all_users:
        return "users";
      case ApiPath.all_products:
        return "products";
    }
  }
}