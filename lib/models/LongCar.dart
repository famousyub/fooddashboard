

class LongCar {
  final String id;
  final String code;
  final String latitude;
   final String longitude;
    final String altitude;
    final int speed_gps;
    final int effective_speed;
    final int engine_rpm;

    final int engine_temperature;
    final int fuel_level;
    
    final int kilometrage;
   
    



  LongCar({required this.id,required this.code,required this.latitude ,required this.longitude, required this.altitude,
  required this.speed_gps , required this.effective_speed,required this.engine_rpm, required this.engine_temperature,required this.fuel_level,
  required this.kilometrage});

  factory LongCar.fromJson(Map<String, dynamic> json) {
    return LongCar(
      id: json['id'],
      code: json['code'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      altitude: json['altitude'],
      speed_gps: json['speed_gps'],
      effective_speed: json['effective_speed'],
      engine_rpm: json['engine_rpm'],
      engine_temperature: json['engine_temperature'],
      fuel_level: json['fuel_level'],
      kilometrage: json['kilometrage']
    );
  }
}