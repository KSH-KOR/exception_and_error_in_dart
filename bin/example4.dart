void main(List<String> args) {
  final db = MockDatabase();
  try{
    //db.open();
    db.getData();
    db.close(); 
    ///in this case if there is any exception in try block 
    ///before this db closing function, 
    ///then it wont be exceuted and the db will not be closed safely
  } on DatabaseNotOpenException catch(e){
    print(e);
  } catch(e){
    print(e);
  } finally{
    ///so we need to make sure to close it no matter what by using finally block
    db.close();
  }
}

class MockDatabase{
  bool _isDbOpen = false;
  Future<void> open(){
    return Future.delayed(Duration(seconds: 1), () {
      _isDbOpen = true;
      print('Database opened');
    });
  }
  Future<void> getData(){
    if(!_isDbOpen) throw DatabaseNotOpenException();

    return Future.delayed(Duration(seconds: 1), () => "fake data");
  }
  Future<void> close(){
    return Future.delayed(Duration(seconds: 1), (){
      _isDbOpen = false;
      print('Database closed');
    });
  }
}

class DatabaseNotOpenException implements Exception{
  static const exceptionName = "DatabaseNotOpenException";
  @override
  String toString() => exceptionName;
}