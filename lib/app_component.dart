import 'package:angular/angular.dart' show coreDirectives, Component;
import 'package:angular_forms/angular_forms.dart';
import 'src/date_picker/date_picker_component.dart';
@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [coreDirectives,formDirectives,DatePickerComponent],
  styleUrls: ['./app_component.css'],
)
class AppComponent {
  var name = 'Angular';
  var title = 'Hero App';
  String date;
  selectedDate(String d){
    date = d;
  }
}
