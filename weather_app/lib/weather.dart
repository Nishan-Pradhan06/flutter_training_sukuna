
class Weather {
  final String currentCondition;
  final double tempInCelsious;
  Weather({required this.currentCondition, required this.tempInCelsious});

 



  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      currentCondition: map['currentCondition'],
      tempInCelsious: map['tempInCelsious'] ,
    );
  }

  
}
