import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:commonc_github_search/common_github_search.dart';


class GithubClient {
  final String baseUrl;
  final http.Client httpClient;

  GithubClient({
    http.Client httpClient,
    this.baseUrl = "https://api.github.com/search/repositories?q=",
  }) : this.httpClient = httpClient ?? http.Client();

  Future<SearchResult> search(String term) async {
    final response = await httpClient.get(Uri.parse("$baseUrl$term"));
    final result = json.decode(response.body);

    if (response.statusCode == 200) {
      return SearchResult.fromJson(result);
    } else {
      throw SearchResultError.fromJson(result);
    }
  }
}