import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ListaTarefa/listaDeTarefa/lista.controller.dart';
import 'package:ListaTarefa/listaDeTarefa/lista.model.dart';

class ListaTarefaPage extends StatefulWidget {
  @override
  _ListaTarefaPageState createState() => _ListaTarefaPageState();
}

class _ListaTarefaPageState extends State<ListaTarefaPage> {
  ListaController _controller = new ListaController();
  TextEditingController _textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.fetchLista();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _controller.fetchLista();
            },
          )
        ],
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () => _modelAddTodo(context),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Observer(builder: (_) {
        return ListView.builder(
          itemCount: _controller.listaTarefas?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            ListaTarefa _lista = _controller.listaTarefas[index];
            return ListTile(
              title: Text(_lista.descricao),
              leading: Checkbox(
                activeColor: Colors.black,
                checkColor: Colors.white,
                value: _lista.check,
                onChanged: (val) => {_lista.check = val, _updateTodo(_lista)},
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  _controller.remove(_lista.cod);
                },
              ),
              onLongPress: () {
                _textEditingController.text = _lista.descricao;
                _modelAddTodo(context, lista: _lista);
              },
            );
          },
        );
      }),
    );
  }

  _modelAddTodo(context, {ListaTarefa lista}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(lista != null ? 'Atualizar Tarefa' : 'Criar Tarefa'),
          content: TextFormField(
            controller: _textEditingController,
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                lista != null ? _updateTodo(lista) : _addTodo();
              },
              child: Text('Salvar'),
            )
          ],
        );
      },
    ).then((_) => {_textEditingController.clear()});
  }

  _addTodo() async {
    if (_validInput()) {
      await _controller.create(_textEditingController.text);
      Navigator.pop(context);
    }
  }

  _updateTodo(ListaTarefa lista) async {
    if (_validInput()) {
      lista.descricao = _textEditingController.text;
      await _controller.update(lista);
      Navigator.pop(context);
      return;
    }
    await _controller.update(lista);
  }

  bool _validInput() {
    return (_textEditingController.text != null &&
        _textEditingController.text != '');
  }
}
