import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  final x;
  Home(this.x);
  @override
  State<StatefulWidget> createState() {
    return _HomeState(x);
  }
}

class _HomeState extends State<Home> {
  var locate;
  _HomeState(this.locate);

  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var country;
  var location;
  var minTemp;
  var maxTemp;
  var pressure;

  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?q=' +
            locate.toString() +
            '&units=imperial&appid=8a32ea05eb8fdd315dbe2e7bf54f175c'));
    var results = jsonDecode(response.body);
    setState(() {
      this.location = results['name'];
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
      this.country = results['sys']['country'];
      this.minTemp = results['main']['temp_min'];
      this.maxTemp = results['main']['temp_max'];
      this.pressure = results['main']['pressure'];
    });
  }

  @override
  void initState() {
    print(locate);
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Demo Weather API App',
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
        backgroundColor: Color.fromRGBO(0, 0, 204, 1),
        foregroundColor: Colors.white,
        //toolbarHeight: (5 / 100) * MediaQuery.of(context).size.height,
      ),
      backgroundColor: Color.fromRGBO(230, 230, 255, 1),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(0, 0, 204, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        country != null ? country.toString() : 'Loading',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Bungasai',
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          location != null
                              ? 'City: ' + location.toString()
                              : 'Loading',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Bungasai',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Text>[
                    Text(
                      minTemp != null
                          ? 'Min: ' + minTemp.toString() + '\u00B0'
                          : 'Loading',
                      style: TextStyle(fontSize: 13.0, color: Colors.white),
                    ),
                    Text(
                      temp != null ? temp.toString() + '\u00B0' : 'Loading',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 40.0,
                        color: Colors.white,
                        fontFamily: 'Bungasai',
                      ),
                    ),
                    Text(
                      maxTemp != null
                          ? 'Max: ' + maxTemp.toString() + '\u00B0'
                          : 'Loading',
                      style: TextStyle(fontSize: 13.0, color: Colors.white),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : 'Loading',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      //fontFamily: 'Bungasai',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: Text(
                      'Temperature',
                    ),
                    trailing: Text(
                        temp != null ? temp.toString() + '\u00B0' : 'Loading'),
                  ),
                  Divider(
                    endIndent: (5 / 100) * MediaQuery.of(context).size.width,
                    indent: (5 / 100) * MediaQuery.of(context).size.width,
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text(
                      'Weather',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    trailing: Text(description != null
                        ? description.toString()
                        : 'Loading'),
                  ),
                  Divider(
                    endIndent: (5 / 100) * MediaQuery.of(context).size.width,
                    indent: (5 / 100) * MediaQuery.of(context).size.width,
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text(
                      'Humidity',
                    ),
                    trailing: Text(
                        humidity != null ? humidity.toString() : 'Loading'),
                  ),
                  Divider(
                    endIndent: (5 / 100) * MediaQuery.of(context).size.width,
                    indent: (5 / 100) * MediaQuery.of(context).size.width,
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text(
                      'Wind Speed',
                    ),
                    trailing: Text(
                      windSpeed != null ? windSpeed.toString() : 'Loading',
                    ),
                  ),
                  Divider(
                    endIndent: (5 / 100) * MediaQuery.of(context).size.width,
                    indent: (5 / 100) * MediaQuery.of(context).size.width,
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.mercury),
                    title: Text('Pressure'),
                    trailing: Text(
                      pressure != null ? pressure.toString() : 'Loading',
                    ),
                  ),
                  Divider(
                    endIndent: (5 / 100) * MediaQuery.of(context).size.width,
                    indent: (5 / 100) * MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
