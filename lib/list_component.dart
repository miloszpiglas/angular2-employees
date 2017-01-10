import 'package:angular2/core.dart';

class City
{
  String name;
  String postalCode;

  City(this.name, this.postalCode);
}

class Employee
{
  String name;
  String surname;
  num age;
  City city;

  Employee(this.name, this.surname, this.age, this.city);
}

@Component
(
    selector: '[city-ref]',
    template: '{{city.name}}/{{city.postalCode}}'
)
class CityRef
{
  @Input()
  City city;
}

@Component
(
    selector: '[employee-ref]',
    template: '''
     <td>{{employee.name}}</td>
     <td>{{employee.surname}}</td>
     <td>{{employee.age}}</td>
     <td city-ref [city] = employee.city></td>
    ''',
    directives: const [CityRef]
)
class EmployeeRef
{
  @Input()
  Employee employee;
}

@Component
(
    selector: 'items-list',
    directives: const [EmployeeRef],
    template: '''
    <table border=1>
     <tr>
      <th>Name</th>
      <th>Surname</th>
      <th>Age</th>
      <th>City</th>
     </tr>
     <tr employee-ref *ngFor="let e of employees" [employee]=e
        (click) = "rowSelected(e)"
        [class.selected]="selectedEmployee==e"
     >
     </tr>
     </table>
''',
    styles: const [
    ''' .selected {background-color: red} '''
    ]
)
class ListComponent
{
  List<Employee> employees = [
    new Employee('John', 'Doe', 33, new City('Warsaw', '00-001')
                 ),
    new Employee('Uncle', 'Ben', 66, new City('Krakow', '22-541'))];
  Employee selectedEmployee;

  void rowSelected(Employee e)
  {
    print(e.name);
    selectedEmployee = e;
  }
}