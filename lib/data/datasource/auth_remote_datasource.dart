import 'package:dartz/dartz.dart';
import 'package:flutter_krustypos/core/constants/variable.dart';
import 'package:flutter_krustypos/data/datasource/auth_local_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_krustypos/data/models/response/auth_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
    String email,
    String password,
  ) async {
    final url = Uri.parse('${Variable.baseUrl}/api/login');

    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left('Failed to login: ${response.body}');
    }
  }

  Future<Either<String, bool>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variable.baseUrl}/api/logout');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${authData!.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      await AuthLocalDatasource().removeAuthData();
      return Right(true);
    } else {
      return Left('Failed to logout: ${response.body}');
    }
  }
}
