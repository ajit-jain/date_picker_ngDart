import 'dart:async';
import 'package:angular/angular.dart' show coreDirectives,Component,OnInit,Output;
import 'package:angular_forms/angular_forms.dart';
import 'dart:html';

@Component(
  selector:'date-picker',
  templateUrl:'date_picker_component.html',
  styleUrls:['date_picker_component.css'],
  directives: [coreDirectives,formDirectives]
)
class DatePickerComponent implements OnInit{
  final _controlOutput = StreamController.broadcast();
@Output()
  Stream get done => _controlOutput.stream;
  
  var selectedMonth;
  var selectedYear;
  String selectedDate;

  List<int> grid = new List(42) ;
  bool isMobileDevice = false;
  bool openModal = false;
  void ngOnInit() {
    RegExp regExp = new RegExp(
      r"Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini",
      caseSensitive: false,
    );
    if (regExp.hasMatch(window.navigator.userAgent)) {
      isMobileDevice = true;
    } else {
      isMobileDevice = false;
    }
    print(isMobileDevice);
    initializeCalender();
  }

  void initializeCalender([DateTime date]) {
    date = date ?? DateTime.now();
    print(date.month);
    selectedMonth = date.month;
    selectedYear = date.year;
    print(date.weekday.toInt());
    initializeGrid(selectedMonth, selectedYear);
  }
  void initializeGrid(month,year){
      DateTime startOfMonth = new DateTime(year,month,1);
      DateTime endOfMonth = new DateTime(year,month + 1,0);
      int startIndex = startOfMonth.weekday.toInt();
      startIndex = (startIndex == 7) ? 0 :( startIndex );
      int endIndex = endOfMonth.day + startIndex;
      for(int i=0;i<startIndex;i++){
        grid[i] = -1;
      }
      for(int i=startIndex,j=1;i < endIndex;i++,j++){
        grid[i] = j;
        
      }
      for(int i=endIndex;i<grid.length;i++){
        grid[i] = -1;
      }
  }
  convertRowCountToArray(len,cols){
    var count = len/cols;
    var arr = [];
    for(int i=0;i<count;i++){
        arr.add(i);
    }
    return arr;
  }
  getMonth(month){
    var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    return months[month-1];
  }
  void prevMonth(month){
    if(month < 1){
      month = 12;
      selectedYear = selectedYear - 1;
    }
    selectedMonth = month;
    initializeGrid(selectedMonth, selectedYear);
  }
  void nextMonth(month){
    if(month > 12){
      month = 1;
      selectedYear = selectedYear + 1;
    }
    selectedMonth = month;
    initializeGrid(selectedMonth, selectedYear);
  }
  void prevYear(){
    selectedYear -=1;
    initializeGrid(selectedMonth, selectedYear);
    
  }
  void nextYear(){
    selectedYear+=1;
    initializeGrid(selectedMonth, selectedYear);
    
  }
  dateSelected(year,month,day){
    var date = DateTime.utc(year,month,day);
    String dateSlug ="${date.day.toString().padLeft(2,'0')}/${date.month.toString().padLeft(2,'0')}/${date.year.toString()}";
    selectedDate = dateSlug;
    String dateSlug2 ="${date.year.toString()}-${date.month.toString().padLeft(2,'0')}-${date.day.toString().padLeft(2,'0')}";
    
    openModal = false;
    this._controlOutput.add(dateSlug2);
  }
  setDate(dynamic date){
    this._controlOutput.add(date.value);
    
  }
}