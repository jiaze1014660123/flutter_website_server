import "dart:convert";
import 'dart:io';
import 'dart.dart';

main() async {
  var requestServer = await HttpServer.bind('172.16.120.219', 8080);
  print('http服务启动起来');
  // 处理请求
  await for (HttpRequest request in requestServer) {
    handleMessage(request);
  }
}

void handleMessage(HttpRequest request) {
  try {
     print(request.method);
    if (request.method == 'GET') {
      handleGET(request);
    } else if (request.method == 'POST') {
      handlePOST(request);
    }
  } catch (e) {
    print('出现了一个错误：$e');
  }
}

void handleGET(HttpRequest request) {
  // 获取请求参数
  var action = request.uri.queryParameters['actions'];
  print(action);
  if (action == 'getProducts') {
    print('获取产品数据...');
    request.response
      ..statusCode = HttpStatus.ok
      ..write(json.encode(products))
      ..close();
  }
  if (action == 'getNews') {
    print('获取新闻数据...');
    request.response
      ..statusCode = HttpStatus.ok
      ..write(json.encode(products))
      ..close();
  }
}

void handlePOST(HttpRequest request) {
  request.response
    ..write('POST request success...')
    ..close();
}
