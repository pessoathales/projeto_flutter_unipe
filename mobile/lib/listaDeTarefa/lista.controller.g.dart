// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaController on _ListaControllerBase, Store {
  final _$listaTarefasAtom = Atom(name: '_ListaControllerBase.listaTarefas');

  @override
  List<ListaTarefa> get listaTarefas {
    _$listaTarefasAtom.context.enforceReadPolicy(_$listaTarefasAtom);
    _$listaTarefasAtom.reportObserved();
    return super.listaTarefas;
  }

  @override
  set listaTarefas(List<ListaTarefa> value) {
    _$listaTarefasAtom.context.conditionallyRunInAction(() {
      super.listaTarefas = value;
      _$listaTarefasAtom.reportChanged();
    }, _$listaTarefasAtom, name: '${_$listaTarefasAtom.name}_set');
  }

  final _$fetchListaAsyncAction = AsyncAction('fetchLista');

  @override
  Future fetchLista() {
    return _$fetchListaAsyncAction.run(() => super.fetchLista());
  }

  final _$createAsyncAction = AsyncAction('create');

  @override
  Future create(String descricao) {
    return _$createAsyncAction.run(() => super.create(descricao));
  }

  final _$removeAsyncAction = AsyncAction('remove');

  @override
  Future remove(int cod) {
    return _$removeAsyncAction.run(() => super.remove(cod));
  }

  final _$updateAsyncAction = AsyncAction('update');

  @override
  Future update(ListaTarefa listaTarefa) {
    return _$updateAsyncAction.run(() => super.update(listaTarefa));
  }
}
