import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast_app/weather.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  Weather currentWeather = Weather(temp: 15, description: "晴れ", tempMax: 18, tempMin: 14);
  List<Weather> hourlyWeather = [
    Weather(temp: 20, description: "晴れ", time: DateTime(2023,8,2,10),rainyPercent: 0),
    Weather(temp: 18, description: "晴れ",time: DateTime(2023,8,2,11),rainyPercent: 90),
    Weather(temp: 17, description: "晴れ", time: DateTime(2023,8,2,12),rainyPercent: 70),
    Weather(temp: 19, description: "晴れ", time: DateTime(2023,8,2,13),rainyPercent: 20),
    Weather(temp: 10, description: "晴れ", time: DateTime(2023,8,2,10),rainyPercent: 0),
    Weather(temp: 12, description: "晴れ",time: DateTime(2023,8,2,11),rainyPercent: 90),
    Weather(temp: 13, description: "晴れ", time: DateTime(2023,8,2,12),rainyPercent: 70),
    Weather(temp: 13, description: "晴れ", time: DateTime(2023,8,2,13),rainyPercent: 20),
    Weather(temp: 24, description: "晴れ", time: DateTime(2023,8,2,10),rainyPercent: 0),
    Weather(temp: 15, description: "晴れ",time: DateTime(2023,8,2,11),rainyPercent: 90),
    Weather(temp: 12, description: "晴れ", time: DateTime(2023,8,2,12),rainyPercent: 70),
    Weather(temp: 14, description: "晴れ", time: DateTime(2023,8,2,13),rainyPercent: 20),
  ];

  List<Weather> dailyWeather = [
    Weather(temp: 15, description: "晴れ",time: DateTime(2023,8,3),rainyPercent: 90, tempMax: 20, tempMin: 16),
    Weather(temp: 12, description: "晴れ", time: DateTime(2023,8,4),rainyPercent: 70,tempMax: 20, tempMin: 16),
    Weather(temp: 14, description: "晴れ", time: DateTime(2023,8,5),rainyPercent: 20,tempMax: 20, tempMin: 16),
    Weather(temp: 15, description: "晴れ",time: DateTime(2023,8,3),rainyPercent: 90, tempMax: 20, tempMin: 16),
    Weather(temp: 12, description: "晴れ", time: DateTime(2023,8,4),rainyPercent: 70,tempMax: 20, tempMin: 16),
    Weather(temp: 14, description: "晴れ", time: DateTime(2023,8,5),rainyPercent: 20,tempMax: 20, tempMin: 16),
    Weather(temp: 15, description: "晴れ",time: DateTime(2023,8,3),rainyPercent: 90, tempMax: 20, tempMin: 16),
    Weather(temp: 12, description: "晴れ", time: DateTime(2023,8,4),rainyPercent: 70,tempMax: 20, tempMin: 16),
    Weather(temp: 14, description: "晴れ", time: DateTime(2023,8,5),rainyPercent: 20,tempMax: 20, tempMin: 16),
  ];

  List<String> weekDay = ["月","火","水","木","金","土","日"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Column(
        children: [
          Container(
            width: 200,
            child: TextField(
              onSubmitted: (value){
                print(value);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "郵便番号を入力"),
            )
            ),
          SizedBox(height: 50,),
          Text("大阪市", style: TextStyle(fontSize: 25),),
          Text(currentWeather.description!,style: TextStyle(fontSize: 25)),
          Text("${currentWeather.temp}°",style: TextStyle(fontSize: 80)),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text("最高:${currentWeather.tempMax}°"),),
            Text("最低:${currentWeather.tempMin}°")
          ],),
          SizedBox(height: 50,),
          Divider(height: 0,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: hourlyWeather.map((weather){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0 ,vertical: 8.0),
                  child: Column(
                    children: [
                      Text("${DateFormat("H").format(weather.time!)}時"),
                      Text("${weather.rainyPercent}%", style: TextStyle(color: Colors.blue),),
                      Icon(Icons.wb_sunny_sharp),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("${weather.temp}", style: TextStyle(fontSize: 18),),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Divider(height: 0,),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: dailyWeather.map((weather){
                    return Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            child: Text("${weekDay[weather.time!.weekday - 1]}曜日")),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.wb_sunny_sharp),
                              Text("${weather.rainyPercent}%", style: TextStyle(color: Colors.blue),),
                            ],
                          ),
                          Container(
                            width: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${weather.tempMax}"),
                                Text("${weather.tempMin}", style: TextStyle(color: Colors.black87),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      )
      ),
    );
  }
}