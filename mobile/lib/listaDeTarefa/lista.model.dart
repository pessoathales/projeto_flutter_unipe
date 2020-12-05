class ListaTarefa {
  String descricao;
  int cod;
  bool check;

  ListaTarefa({this.descricao, this.cod, this.check});

  ListaTarefa.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    cod = json['cod'];
    check = json['check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dados = new Map<String, dynamic>();
    dados['descricao'] = this.descricao;
    dados['cod'] = this.cod;
    dados['check'] = this.check;
    return dados;
  }
}
