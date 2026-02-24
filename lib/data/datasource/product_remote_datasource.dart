// import 'package:dartz/dartz.dart';
// import 'package:flutter_krustypos/core/constants/variable.dart';
// import 'package:flutter_krustypos/data/models/response/product_response_model.dart';
// import 'package:http/http.dart' as http;

// class ProductRemoteDatasource {
//   Future<Either<String, ProductResponseModel>> getProducts() async {
//     final url = Uri.parse('${Variable.baseUrl}/api/products');
//     // final authData = await AuthlocalDataSource().getAuthData();
//     final response = await http.get(url, headers:
//     {
//       'Authorization': 'Bearer ${authData.token}',
//       'Accept': 'application/json',
//     });

//     if (response.statusCode == 200){
//       return Right()
//     }
//   }
// }
