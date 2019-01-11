## Setup for Development

Welcome to the example app used in the
[Setup for Development](https://webdev.dartlang.org/angular/guide/setup) page
of [Dart for the web](https://webdev.dartlang.org).

You can run a [hosted copy](https://webdev.dartlang.org/examples/quickstart) of this
sample. Or run your own copy:

1. Create a local copy of this repo (use the "Clone or download" button above).
2. Get the dependencies: `pub get`
3. Get the webdev tool: `pub global activate webdev`
4. Launch a development server: `webdev serve`
5. In a browser, open [http://localhost:8080](http://localhost:8080)

---

*Note:* The content of this repository is generated from the
[Angular docs repository][docs repo] by running the
[dart-doc-syncer](//github.com/dart-lang/dart-doc-syncer) tool.
If you find a problem with this sample's code, please open an [issue][].

[docs repo]: //github.com/dart-lang/site-webdev/tree/master/examples/ng/doc/quickstart
[issue]: //github.com/dart-lang/site-webdev/issues/new?title=[master]%20examples/ng/doc/quickstart


## Date Picker Component

Date Picker component is used to pick date from a calender. In Mobile devices it will show html5 date picker but for desktop devices it shows custom floating calender. 

*How to use:* In desktop when you focus on the input a calender will be displayed. In calender can select any date then selected date would be shown in the input box.

*Icons:* In calender `<<` backwards to the previous year  , `>>` forwards to the next year, `<` backwards to the previous month, `>` forwards to the next month.

*In mobile view :* shows html5 date picker whenever user changes the date from it got reflected by the text shown below it.

Used stream api in dart to send the output of the date picker.
