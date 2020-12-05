import 'package:ListaTarefa/listaDeTarefa/lista.model.dart';
import 'package:ListaTarefa/listaDeTarefa/lista.service.dart';
import 'package:mobx/mobx.dart';

part 'lista.controller.g.dart';

class ListaController = _ListaControllerBase with _$ListaController;

abstract class _ListaControllerBase with Store {
  @observable
  List<ListaTarefa> listaTarefas = [];

  @action
  fetchLista() async {
    listaTarefas = await ListaService().listAll();
  }

  @action
  create(String descricao) async {
    await ListaService().create(descricao);
    fetchLista();
  }

  @action
  remove(int cod) async {
    await ListaService().remove(cod);
    fetchLista();
  }

  @action
  update(ListaTarefa listaTarefa) async {
    await ListaService().update(listaTarefa);
    fetchLista();
  }
}
