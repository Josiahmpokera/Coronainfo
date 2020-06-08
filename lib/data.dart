class Corona{
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int recovered;

  Corona([this.country, this.todayCases, this.deaths, this.recovered, this.cases]);
}

List<String> CountryFlag = [
  'assets/tanzania.png',
  'assets/usa.png',
  'assets/england.png',
  'assets/china.png',
  'assets/kenya.png',
  'assets/iran.png',
  'assets/italy.png'
];

class Disease {
  final String nchi;
  final int kesi;
  final int leo;
  final int vifo;
  final int pona;
  final int waumwao;

  Disease({this.nchi, this.waumwao, this.vifo, this.pona, this.leo, this.kesi});

  factory Disease.fromJson(Map<String, dynamic> json){
    return Disease(
      nchi: json['country'],
      kesi: json['cases'],
      leo: json['todayCases'],
      vifo: json['deaths'],
      pona: json['recovered'],
      waumwao: json['active'],
    );
  }

}


/*

 */