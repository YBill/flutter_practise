# flutter_practise

A new Flutter project.

## Getting Started

1、多语言

配置：

（1）在 pubspec.yaml 中添加：

```yaml
  # 国际化支持
  flutter_localizations:
    sdk: flutter

  intl: ^0.18.1

  flutter:
    # 添加代码生成（合成包）支持
    generate: true
```
> 添加 flutter_localizations 和 intl 包。并设定 generate 为 true，当项目运行起来后，生成本地化工具代码。

（2）项目根目录添加 l10n.yaml 文件，内容如下：
```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

> l10n.yaml 配置文件的用途是：自定义生成将导入应用程序本地化类的工具。
- arb-dir 指明从哪里找输入的文件，文件夹内包含的文件后缀是 .arb。
- template-arb-file 模版文件，定义翻译的元数据，该文件必须在 arb-dir 文件夹内创建。
- output-localization-file 定义该工具将生成的主要 Dart 类文件。并且应用程序将导入。所有生成的文件都是通过文件夹 arb-dir 下的文件生成。

（3）创建 arb 模版，比如 lib/l10n/app_en.arb，内容如下：
```json
{
    "@@locale": "en",

    "gridview": "GridView",
    "time": "#value#hour"
}
```

> @@locale 指明本地化的英文，当然你也可以不要这个声明。
> 带参数的字符串没使用下面方式指定，编译就会生成带参数的方法，比如下面time(int hour, String ma)
> 单数复数?,暂不使用
```json
{
  "timeLabel": "Time",
  "time": "{hour} hour {ma}",
  "@time": {
    "description": "xxx hour, morning and afternoon",
    "placeholders": {
      "hour": {
        "type": "int"
      },
      "ma": {
        "type": "String",
        "example": "am"
      }
    }
  }
}
```

（4）生成代码：

```shell
flutter gen-l10n
```
或直接pub-get也可以
```shell
flutter pub get
```

（5）集成自动化生成的本地类

在 MaterialApp 中配置：

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```

（6）使用

```dart
AppLocalizations.of(context).gridview
```

（7）其他

监听多语言切换，可以在 MaterialApp 中使用 localeResolutionCallback 或 localeListResolutionCallback 中处理