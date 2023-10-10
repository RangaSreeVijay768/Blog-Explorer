import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(const WeatherState.initial());

  Future<void> fetchData() async {
    String api = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m";
    // try{
    //   final response = await http.get(Uri.parse(api));
    //   if (response.statusCode == 200){
    //
    //   }
    // }
  }
}
