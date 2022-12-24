void main(List<String> args) {
  tryCreatingPerson(age: 20);
  tryCreatingPerson(age: -1);
  tryCreatingPerson(age: 141);
}

void tryCreatingPerson({int age = 0}){
  try{
    print(Person(age: age));
  } on InvalidAgeException catch(exception, stackTrace){
    print(exception.runtimeType);
    print(exception);
    //print(stackTrace);
  }
}

class InvalidAgeException implements Exception{
  static const exceptionName = "InvalidAgeException";
  final int age;
  final String msg;
  const InvalidAgeException({required this.age, required this.msg});

  @override
  String toString() => "$exceptionName: $msg, $age";
}

class Person{
  final int age;
  Person({required this.age}){
    if(age < 0){
      throw InvalidAgeException(msg: 'Age must be positive', age: age);
    } else if(age > 140){
      throw InvalidAgeException(msg: "Age must be under 140", age: age);
    }
  }
  @override
  String toString() {
    return "person's age: $age";
  }
}