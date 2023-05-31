class Diary {
  final String id;
  final String contents;
  final List<dynamic> tags;
  final String feeling;
  final List<dynamic> imageUrl;
  final String date;

  Diary({this.id='', required this.contents, required this.tags, required this.feeling, required this.imageUrl, required this.date});

  //서버로부터 map형태의 자료를 MessageModel형태의 자료로 변환해주는 역할을 수행함.
  factory Diary.fromMap({required String id,required Map<String,dynamic> map}){
    return Diary(
      id: id,
      contents: map['contents'],
      tags: map['tags'],
      feeling: map['feeling'],
      imageUrl: map['imageUrl'],
      date: map['date']
    );
  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> data = {};
    data['content']=contents;
    return data;
  }

}