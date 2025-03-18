import '../Ratel/annotations/geral_annotations.dart';

@Json()
class Address {
  @Column(name: 'id')
  int? id;

  @Column(name: 'cep')
  String? cep;

  @Column(name: 'street')
  String? street;

  @Column(name: 'complement')
  String? complement;

  @Column(name: 'unit')
  String? unit;

  @Column(name: 'neighborhood')
  String? neighborhood;

  @Column(name: 'locality')
  String? locality;

  @Column(name: 'uf')
  String? uf;

  @Column(name: 'estado')
  String? estado;

  @Column(name: 'region')
  String? region;

  @Column(name: 'ibge_code')
  String? ibgeCode;

  @Column(name: 'gia_code')
  String? giaCode;

  @Column(name: 'ddd')
  String? ddd;

  @Column(name: 'siafi_code')
  String? siafiCode;

  Address({
    this.id,
    this.cep,
    this.street,
    this.complement,
    this.unit,
    this.neighborhood,
    this.locality,
    this.uf,
    this.estado,
    this.region,
    this.ibgeCode,
    this.giaCode,
    this.ddd,
    this.siafiCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      cep: json['cep'] as String?,
      street: json['logradouro'] as String?,
      complement: json['complemento'] as String?,
      unit: json['unidade'] as String?,
      neighborhood: json['bairro'] as String?,
      locality: json['localidade'] as String?,
      uf: json['uf'] as String?,
      estado: json['estado'] as String?,
      region: json['regiao'] as String?,
      ibgeCode: json['ibge'] as String?,
      giaCode: json['gia'] as String?,
      ddd: json['ddd'] as String?,
      siafiCode: json['siafi'] as String?,
    );
  }
}
