AGi18n
======

Utility to easily localize your iOS apps by automatically extracting texts from code and XIB files into a Localizable strings and inject them back on runtime without changing your XIB files. [Check out the demo video](http://www.youtube.com/watch?v=4Cxv24W2MqA)


Why use AGi18n?
---------------

Localizing apps that use Interface Builder is tedious. You have a few methods provided by Apple (like the ibtool) but they are hard to use, time consuming, difficult to mantain and their output format is not as clean as the one in Localizable.strings using NSLocalizableString. You can find more info about the problems of the standard ways here [Localization in iOS apps made simple](http://angelolloqui.com/blog/28-Localization-in-iOS-apps-made-simple).

By using AGi18n you make all your IB elements to use your Localizable.strings by default, without changing any single line of code or property in your IB files. It just works! Moreover, AGi18n comes with two useful utilities:

* **genxibstrings**: It works pretty much the same way than genstrings do, but for IB files. For example, calling this method:
```genxibstrings``` will generate a file Localizable.strings with the labels from your IB files in this format:

```
/* SDCartItemCell~iphone.xib, SDCartItemSmallCell~iphone.xib */
"price" = "price";

/* SDCartItemCell~iphone.xib, SDCartItemSmallCell~iphone.xib */
"quantity" = "quantity";

/* SDOrderCell~ipad.xib */
"status" = "status";
```

* **agi18n**: This tool will execute the previous genxibstrings together with genstrings for every language in your app, and will append and merge the results into the same one file for each language, dealing with duplicated keys. This is the tool you should call every time that you make a change in your app, as it will add all your new strings but always preserving the already existing ones. It is very handy to mantain your localizable strings up to date without losing your already translated strings.


Installation
------------

The library is composed of two parts. A set of command line utilities and the source code you need to import in your project in order to activate AGi18n.

To **install the command line utilities**, just run this installation tool
```curl https://raw.github.com/angelolloqui/AGi18n/master/bin/install.sh | sh```

or, if you want to do it manually, copy and paste the ```genxibstrings``` and ```agi18n``` files in any folder contained in your PATH (with +x permission)

** WARNING **: The current version of AGi18n tools require ruby 1.9.0.

Then, for any project where you want to use AGi18n, you need to **include the source files** contained in the ```/lib``` folder. For that you can use CocoaPods or just drag & drop the files into your project. [TODO]


Internals
---------
The library swizzles the ```[NSObject awakeFromNib]``` method to hook a call to a new empty method called ```[NSObject localizeFromNib]```, so virtually every object can be localized in the XIB files. AGi18n also includes a built-in set of categories for standard UI components such as UILabel, UIButton, UITextField... to correctly set their localizable properties (text, title, placeholders,...). 

If you want to localize a custom component, just overwrite the method ```localizeFromNib``` and place your localization logic there. This step is not needed if your custom component is just a composition of other standard UI components.


Caveats
-------

All this magic can not come without some caveats:

* **Performance**: Using AGi18n will have some performance impact when loading your views due to the extra lookup in the translations table performed for every single text. In my tests the impact is so low  (about 5% in the controllers instantiation) that is not appreciable, but it is something that you may want to check in your app before shipping to your users.

* **Extra keys in Localizable.strings**: All visible texts are added to your Localizable.strings, including those which are never displayed because they are always set by code after loading the view. This is a caveat that also happens if you use the standard way (with ```ibtool```) and that AGi18n can not resolve.

* **Use UTF-16LE**: The current implementation of agi18n tools use a UTF-16LE byte encoding. Please remember to set the proper encoding in XCode or you will see incorrect data. Support for UTF-8 might be added in the future.

* more ?


License
-------

Made available under the MIT License.


Collaboration
-------------

Forks, patches and other feedback are always welcome.

Thanks for your pull requests to:
- [sbusch-mobivention](https://github.com/sbusch-mobivention)

Credits
-------

AGi18n is brought to you by [Angel Garcia Olloqui](http://angelolloqui.com). You can contact me on:

Project Page: [AGi18n](https://github.com/angelolloqui/AGi18n)

Personal webpage: [angelolloqui.com](http://angelolloqui.com)

Twitter: [@angelolloqui](http://twitter.com/angelolloqui)

LinkedIn: [angelolloqui](http://www.linkedin.com/in/angelolloqui)


