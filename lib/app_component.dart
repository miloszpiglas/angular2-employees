import 'package:angular2/core.dart';
import 'package:employees/list_component.dart';

@Component(
    selector: 'my-app',
    template: '''
      <h1>{{title}}</h1> 
      <items-list>table loading</items-list>
      ''',
    directives: const [ListComponent]
)
class AppComponent
{
  String title = 'List of employees';
}
