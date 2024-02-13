import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/error_model.dart';
import '../utils/toast.dart';
import 'app_exception.dart';

class NetworkServices {
  // Main Url
  final String domainUrl = "https://api.open-meteo.com/v1/forecast?";
// for Creating header
  Future<Map<String, String>> get headers async {
    Map<String, String> headers = {};
    headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    return headers;
  }

// for Creating full uri
  Uri getFullUrl(String url) {
    String fullPath = domainUrl + url;

    return Uri.parse(fullPath);
  }

// for Get call
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        getFullUrl(url),
        headers: await headers,
      );

      debugPrint('API Service GET response');
      debugPrint(response.body);
      responseJson = _returnResponse(response);
    } on SocketException catch (e) {
      showToast("SomeThing Went Wrong");
      debugPrint(e.toString());
    }
    return responseJson;
  }

// for response convertion
  dynamic _returnResponse(http.Response response) {
    debugPrint('API Service _returnResponse');
    debugPrint(response.body);

    if (response.body.toString().isEmpty) {
      return response;
    } else {
      switch (response.statusCode) {
        case 200:
          // 200	OK	The requested action was successful.
          return response;

        case 201:
          //201	Created	A new resource was created.

          return response;
        case 202:
          //202	Accepted	The request was received, but no modification has been made yet.

          return response;
        case 204:
          //204	No Content	The request was successful, but the response has no content.
          ErrorResponseModel errorResponse =
              ErrorResponseModel.fromJson(jsonDecode(response.body));
          throw NoDataException(errorResponse.message.toString());

        case 400:
          //400	Bad Request	The request was malformed.
          ErrorResponseModel errorResponse =
              ErrorResponseModel.fromJson(jsonDecode(response.body));
          throw BadRequestException(errorResponse.message.toString());
        case 401:
          //401	Unauthorized	The client is not authorized to perform the requested action.
          ErrorResponseModel errorResponse =
              ErrorResponseModel.fromJson(jsonDecode(response.body));
          throw UnauthorisedException(errorResponse.message.toString());
        case 403:
          ErrorResponseModel errorResponse =
              ErrorResponseModel.fromJson(jsonDecode(response.body));
          throw UnauthorisedException(errorResponse.message.toString());
        case 404:
          //404	Not Found	The requested resource was not found.
          ErrorResponseModel errorResponse =
              ErrorResponseModel.fromJson(jsonDecode(response.body));
          throw ResoruceNotFoundException(errorResponse.message.toString());
        case 415:
          //415	Unsupported Media Type	The request data format is not supported by the server.
          ErrorResponseModel errorResponse =
              ErrorResponseModel.fromJson(jsonDecode(response.body));
          throw UnsupportedMediaTypeException(errorResponse.message.toString());
        case 422:
          //422	Unprocessable Entity	The request data was properly formatted but contained invalid or missing data.
          ErrorResponseModel errorResponse =
              ErrorResponseModel.fromJson(jsonDecode(response.body));
          throw UnprocessableEntityException(errorResponse.message.toString());

        case 500:
          //500	Internal Server Error	The server threw an error when processing the request.
          ErrorResponseModel errorResponse =
              ErrorResponseModel.fromJson(jsonDecode(response.body));
          throw InternalServerErrorException(errorResponse.message.toString());

        default:
          ErrorResponseModel errorResponse =
              ErrorResponseModel.fromJson(jsonDecode(response.body));
          throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode} ${errorResponse.message}',
          );
      }
    }
  }
}
