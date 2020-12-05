import 'package:ListaTarefa/listaDeTarefa/lista.model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ListaService {
  String URL = 'http://10.0.2.2:3000/listatarefa';

  Future<List<ListaTarefa>> listAll() async {
    http.Response response = await http.get(URL);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Iterable list = convert.json.decode(response.body);
      return list.map((i) => ListaTarefa.fromJson(i)).toList();
    }
  }

  Future<bool> create(String descricao) async {
    http.Response response =
        await http.post(URL, body: {'descricao': descricao});
    return (response.statusCode == 200 || response.statusCode == 201);
  }

  Future<bool> remove(int cod) async {
    http.Response response = await http.delete('${URL}/${cod}');
    return (response.statusCode == 200 || response.statusCode == 201);
  }

  Future<bool> update(ListaTarefa _lista) async {
    http.Response response = await http.put('${URL}', body: {
      'cod': _lista.cod.toString(),
      'descricao': _lista.descricao,
      'check': _lista.check.toString()
    });
    return (response.statusCode == 200 || response.statusCode == 201);
  }
}
