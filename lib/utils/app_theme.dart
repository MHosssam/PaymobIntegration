import 'package:flutter/material.dart';

class AppTheme {
  static const _colorSchemeLight = ColorScheme(
    primary: Color(0xff77688F),
    primaryContainer: Color(0xff4A4A4A),
    secondary: Color(0xffB4B4B4),
    background: Color(0xFFFFFFFF),
    surface: Color(0xffF1F1F1),
    error: Colors.red,
    onSecondary: Color(0xFFC5C5C5),
    onSurface: Color(0xff707F89),
    onPrimary: Color(0xffffffff),
    onBackground: Color(0xff00D787),
    onError: Color(0xffE8F0F7),
    brightness: Brightness.light,
  );

  static const _colorSchemeDark = ColorScheme(
    primary: Color(0xff2B76B7),
    primaryContainer: Color(0xffcccccc),
    secondary: Color(0xffB4B4B4),
    background: Color(0xFF333333),
    surface: Color(0xFF444444),
    error: Colors.red,
    onSecondary: Color(0xFFC5C5C5),
    onSurface: Color(0xff999999),
    onPrimary: Color(0xffffffff),
    onBackground: Color(0xff00D787),
    onError: Color(0xffE8F0F7),
    brightness: Brightness.dark,
  );

  static InputDecoration searchInputDecoration(
    BuildContext context, {
    required Brightness brightness,
  }) {
    return const TextField().decoration!.copyWith(
          hintStyle: _getTextTheme(brightness: brightness).caption?.copyWith(
                color: Theme.of(context).colorScheme.surface.withOpacity(.75),
                fontSize: 12,
              ),
          fillColor:
              Theme.of(context).colorScheme.onBackground.withOpacity(.05),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 2),
            child: Icon(
              Icons.search,
              size: 10,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          labelStyle: _getTextTheme(brightness: brightness).caption?.copyWith(
                color: Theme.of(context).colorScheme.secondary.withOpacity(.75),
                fontSize: 10,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.surface.withOpacity(.3),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        );
  }

  static ColorScheme _getCurrentColorScheme({required Brightness brightness}) {
    return (brightness) == Brightness.dark
        ? _colorSchemeDark
        : _colorSchemeLight;
  }

  static ThemeData getTheme(Brightness brightness) {
    var colorScheme = _getCurrentColorScheme(brightness: brightness);
    var textTheme = _getTextTheme(brightness: brightness);
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.orange,
      scaffoldBackgroundColor: colorScheme.background,
      backgroundColor: colorScheme.background,
      colorScheme: colorScheme,
      dialogTheme: const DialogTheme(),
      appBarTheme: AppBarTheme(
        titleSpacing: 0,
        titleTextStyle: textTheme.headline6?.copyWith(
          color: colorScheme.onBackground,
        ),
        elevation: 1,
        shadowColor: Colors.transparent,
        color: colorScheme.background,
        foregroundColor: colorScheme.onBackground,
        centerTitle: false,
      ),
      textTheme: textTheme,
      elevatedButtonTheme: MyButtonThemes.elevatedButtonThemeData(
        brightness: brightness,
      ),
      inputDecorationTheme: _inputDecorationTheme(brightness: brightness),
      cardTheme: CardTheme(
        color: colorScheme.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Colors.transparent),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all<Color>(colorScheme.onPrimary),
        fillColor: MaterialStateProperty.all<Color>(colorScheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        side: BorderSide(color: colorScheme.primary),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(colorScheme.primary),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: colorScheme.primary, size: 12),
        unselectedIconTheme: IconThemeData(
          color: colorScheme.secondaryContainer.withOpacity(.8),
          size: 12,
        ),
        selectedItemColor: colorScheme.secondary,
        unselectedItemColor: colorScheme.surface,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          // fontFamily: MyFontsKeys.fontMedium.value,
          height: 1.2,
          fontSize: 14,
        ),
        unselectedLabelStyle: TextStyle(
          color: colorScheme.secondary,
          // fontFamily: MyFontsKeys.fontMedium.value,
          height: 1.2,
          fontSize: 14,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.background,
        elevation: 0.0,
        modalBackgroundColor: colorScheme.background,
        modalElevation: 0.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
      ),
    );
  }

  static TextTheme _getTextTheme({required Brightness brightness}) {
    var colorScheme = _getCurrentColorScheme(brightness: brightness);
    return TextTheme(
      headline6: TextStyle(
        color: colorScheme.secondary,
        fontSize: 18,
        // fontFamily: MyFontsKeys.fontBold.value,
      ),
      headline5: TextStyle(
        color: colorScheme.secondary,
        fontSize: 16,
        // fontFamily: MyFontsKeys.fontBold.value,
      ),
      headline4: TextStyle(
        color: colorScheme.secondary,
        fontSize: 14,
        // fontFamily: MyFontsKeys.fontBold.value,
      ),
      headline3: TextStyle(
        color: colorScheme.secondary,
        fontSize: 12,
        // fontFamily: MyFontsKeys.fontBold.value,
      ),
      headline2: TextStyle(
        color: colorScheme.secondary,
        fontSize: 12,
        // fontFamily: MyFontsKeys.fontMedium.value,
      ),
      headline1: TextStyle(
        color: colorScheme.secondary,
        fontSize: 14,
        // fontFamily: MyFontsKeys.fontMedium.value,
      ),
      bodyText1: TextStyle(
        color: colorScheme.secondary,
        fontSize: 14,
        // fontFamily: MyFontsKeys.fontRegular.value,
      ),
      bodyText2: TextStyle(
        color: colorScheme.secondary,
        fontSize: 13,
        // fontFamily: MyFontsKeys.fontMedium.value,
      ),
      caption: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 12,
        // fontFamily: MyFontsKeys.fontRegular.value,
      ),
      overline: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 10,
        // fontFamily: MyFontsKeys.fontRegular.value,
      ),
      subtitle1: TextStyle(
        color: colorScheme.primaryContainer,
        height: 1.4,
        fontSize: 14,
        // fontFamily: MyFontsKeys.fontRegular.value,
      ),
      subtitle2: TextStyle(
        color: colorScheme.primaryContainer,
        height: 1.4,
        fontSize: 14,
        // fontFamily: MyFontsKeys.fontMedium.value,
      ),
      button: TextStyle(
        color: colorScheme.background,
        fontSize: 14,
        // fontFamily: MyFontsKeys.fontBold.value,
      ),
    ).apply(
      decorationColor: colorScheme.onSurface,
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );
  }
}

class MyButtonThemes {
  static const double _maxButtonHeight = 30.0;
  static const double _maxButtonWidth = 80;

  static ElevatedButtonThemeData elevatedButtonThemeData(
          {required Brightness brightness}) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            // fontFamily: MyFontsKeys.fontBold.value,
            fontSize: 14,
            height: 1.5,
          ),
          backgroundColor: AppTheme._getCurrentColorScheme(
            brightness: brightness,
          ).primary,
          disabledForegroundColor: AppTheme._getCurrentColorScheme(
            brightness: brightness,
          ).onPrimary,
          elevation: 0,
          shadowColor: Colors.white30,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );

  static TextButtonThemeData textButtonPrimaryCircularTheme(
          {required Brightness brightness}) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppTheme._getCurrentColorScheme(
            brightness: brightness,
          ).primary,
          disabledForegroundColor: AppTheme._getCurrentColorScheme(
            brightness: brightness,
          ).onSecondary,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          minimumSize: const Size(0, _maxButtonHeight),
          maximumSize: const Size(_maxButtonWidth, _maxButtonHeight),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );

  static TextButtonThemeData iconButtonCircleTheme(
          {required Brightness brightness}) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor:
              AppTheme._getCurrentColorScheme(brightness: brightness).primary,
          disabledForegroundColor:
              AppTheme._getCurrentColorScheme(brightness: brightness)
                  .onSecondary,
          shape: const CircleBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          minimumSize: const Size(0, _maxButtonHeight),
          maximumSize: const Size(_maxButtonWidth, _maxButtonHeight),
          elevation: 2,
        ),
      );

  static TextButtonThemeData textButtonPrimaryRectTheme({
    required Brightness brightness,
  }) =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppTheme._getCurrentColorScheme(
            brightness: brightness,
          ).primary,
          disabledForegroundColor: AppTheme._getCurrentColorScheme(
            brightness: brightness,
          ).onSecondary,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          minimumSize: const Size(0, _maxButtonHeight),
          maximumSize: const Size(_maxButtonWidth, _maxButtonHeight),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );

  static TextButtonThemeData transparentTextButton(
      {required Brightness brightness}) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        disabledForegroundColor: AppTheme._getCurrentColorScheme(
          brightness: brightness,
        ).onBackground,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        minimumSize: const Size(0, _maxButtonHeight),
        textStyle: const TextStyle(
          // fontFamily: MyFontsKeys.fontMedium.value,
          fontSize: 14,
        ),
        maximumSize: const Size(_maxButtonWidth, _maxButtonHeight),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

InputDecorationTheme _inputDecorationTheme({
  required Brightness brightness,
}) =>
    InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      floatingLabelStyle: AppTheme._getTextTheme(
        brightness: brightness,
      ).subtitle2,
      labelStyle: AppTheme._getTextTheme(brightness: brightness).subtitle2,
      hintStyle: AppTheme._getTextTheme(
        brightness: brightness,
      ).bodyText2?.copyWith(
            color: AppTheme._getCurrentColorScheme(
              brightness: brightness,
            ).surface,
          ),
      errorStyle: AppTheme._getTextTheme(brightness: brightness)
          .caption
          ?.copyWith(fontSize: 12, color: Colors.red),
      filled: true,
      fillColor: AppTheme._getCurrentColorScheme(
        brightness: brightness,
      ).onBackground,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme._getCurrentColorScheme(
            brightness: brightness,
          ).primary,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        gapPadding: 0,
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        gapPadding: 0,
      ),
      isDense: false,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme._getCurrentColorScheme(brightness: brightness).error,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        gapPadding: 0,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme._getCurrentColorScheme(
            brightness: brightness,
          ).primary,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        gapPadding: 0,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppTheme._getCurrentColorScheme(brightness: brightness).error,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        gapPadding: 0,
      ),
    );
