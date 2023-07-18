# HTML Wrapper

<img src="https://flutter-seo.web.app/assets/assets/wrapp.png"></img>

The `html_wrapper` package provides a simple solution for optimizing Search Engine Optimization (SEO) in Flutter applications by converting essential widgets into real HTML tags. By rendering Flutter widgets as true HTML elements, search engines can better understand the content of your app, leading to improved visibility and search rankings.

## Features

- Convert Flutter widgets into HTML tags to improve SEO.
- Preserve the functionality and styling of Flutter widgets while generating SEO-friendly HTML output.
- Customize HTML attributes and tags to align with SEO best practices.

## Getting Started

#### Installation

Click here: <a href="https://pub.dev/packages/html_wrapper">Pub dev</a>

Add the following dependency to your pubspec.yaml file:

```
dependencies:
    html_wrapper: ^0.0.2
```

Then, run `flutter pub get` to fetch the package.

## Usage

- import the html_wrapper package: ```import 'package:html_wrapper/html_wrapper.dart' as wrapp;```

The library is easy to use, the names and behaviors of the widgets remain the same as classic Widget one exclusivity in each widget is the implementation of `href` key that allow to click on it and redirect in another url using `<a>`tag.

#### Text Widget

the novelty of the Text widget compared to the real one is the addition of the tag key allowing to choose in which html tag we want our text to be between h1, span, strong etc...

```
wrapp.Text(
    'Hello Seo!',
    tag: wrapp.Tag.h1,
    style: TextStyle(
    fontFamily: 'arial',
    fontSize: MediaQuery.of(context).size.width / 6,
    color: Colors.white,
    fontWeight: FontWeight.w900),
),
```

#### Image Widget

all the parameters of an image are processed such as size, fit and urls or images from a folder are correctly display.

```
wrapp.Image(
    height: 200,
    width: 200,
    borderRadius: BorderRadius.circular(200),
    href: 'https://github.com/Antoinegtir',
    src: 'https://avatars.githubusercontent.com/u/114834504?v=4',
    fit: BoxFit.cover,
),
```

#### Robot Widget

In this example, we have a simple layout that displays the text "Hello, world!" in the center of the screen. Additionally, we include the Robots widget to set the `<meta>` tag for search engine crawlers.

The Robots widget is responsible for adding the `<meta>` tag with the specified content attribute value to the HTML head section. In this case, we set the content to 'noindex, nofollow', indicating that search engines should not index or follow the page.

```
Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
        Text(
        'Hello, world!',
        style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 16),
        Robots(content: 'noindex, nofollow'),
    ],
),
```

The project is only at the beginning, there are still a lot of tags to implement and optimization do not hesitate to read the contributing.md if you want to contribute to the project ❤️