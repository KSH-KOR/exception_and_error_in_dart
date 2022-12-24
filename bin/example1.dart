void main(List<String> args) {
  tryCreatingPerson(age: 20);
  tryCreatingPerson(age: -1);
  tryCreatingPerson(age: 141);
}

void tryCreatingPerson({int age = 0}){
  try{
    print(Person(age: age));
  } catch(exception, stackTrace){
    print(exception.runtimeType);
    print(exception);
    //print(stackTrace);
  }
}

class Person{
  final int age;
  Person({required this.age}){
    if(age < 0){
      throw Exception('Age must be positive');
    } else if(age > 140){
      throw Exception("Age must be under 140");
    }
  }
  @override
  String toString() {
    return "person's age: $age";
  }
}