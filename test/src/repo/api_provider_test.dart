import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/src/repo/api_provider.dart';
import 'package:news_app/src/models/item_models.dart';
Future<void> main() async {
  // test where 2+2=4 or not
  test('testing whether 2+2 is 4 or not',(){
    final sum= 2+2;
    expect(4, sum);
  });
  test ('testing whether fetchTopIds returns a list of integer or not',() async {
var apiprovider=ApiProvider();
final body= "[1,2,3,4,5,6,7,8,9]";
MockClient((Request request) async{
  return Response(body,200);

  

});
final res= await apiprovider.fetchTopIds();

expect(jsonDecode(body), res);
  });


  test('testing whetther fetch item returns an ItemModel or not',() async {
    final apiProvider = ApiProvider();
    final body ="""
    {
  "by" : "dhouston",
  "descendants" : 71,
  "id" : 8863,
  "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 9067, 8908, 9055, 8865, 8881, 8872, 8873, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8878, 8870, 8980, 8934, 8876 ],
  "score" : 111,
  "time" : 1175714200,
  "title" : "My YC app: Dropbox - Throw away your USB drive",
  "type" : "story",
  "url" : "http://www.getdropbox.com/u/2/screencast.html"
}
""";
  
  apiProvider.client=MockClient((Request request)async{
    return Response(body,200);
  });


final res =await apiProvider.fetchItems(123);
expect(8863, res.id);
});

}