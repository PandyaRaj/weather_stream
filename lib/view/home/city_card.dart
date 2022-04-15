import 'package:flutter/material.dart';

import '../../data/model/city_weather_detail.dart';

class City_Card extends StatelessWidget {
  City_Card({Key? key, required this.city_card}) : super(key: key);
  List<Listt> city_card;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
// api.fetchDoc(commonList.content[index].id);
// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) =>
//         DetailView(cardId: commonList.content[index].id),
//   ),
// );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                child: Text(
                  '38',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0, left: 18),
                child: Icon(
                  Icons.search,
                  size: 44,
                ),
              ),
              Text(
                '38/39',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.black12),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 3, bottom: 2, left: 15, right: 15),
                    child: Text(
                      'Mon 9\n AM',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
// child: ClipRRect(
//   borderRadius: BorderRadius.circular(8),
//   child: CachedNetworkImage(
//     imageUrl: commonList
//         .content[index].posterUrl
//         .toCompressUrl(300, 200),
//     fit: BoxFit.cover,
//   ),
// ),
      ),
    );
  }
}
