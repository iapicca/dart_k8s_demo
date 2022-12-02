import 'dart:io';

const name = 'server';
const port = 8888;

void main(List<String> arguments) async {
  print('listening on $port');
  final server = await HttpServer.bind(InternetAddress.anyIPv4, port);

  await for (final request in server) {
    request.response
      ..headers.set('Server', name)
      ..headers.set('Content-Type', 'text/plain')
      ..write('hello world');

    await request.response.close();
  }
}
