//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `EventResult`.
    static let eventResult = _R.storyboard.eventResult()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Login`.
    static let login = _R.storyboard.login()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "EventResult", bundle: ...)`
    static func eventResult(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.eventResult)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Login", bundle: ...)`
    static func login(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.login)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 11 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `drop_shadow`.
    static let drop_shadow = Rswift.ColorResource(bundle: R.hostingBundle, name: "drop_shadow")
    /// Color `error_red`.
    static let error_red = Rswift.ColorResource(bundle: R.hostingBundle, name: "error_red")
    /// Color `global_blue`.
    static let global_blue = Rswift.ColorResource(bundle: R.hostingBundle, name: "global_blue")
    /// Color `global_cream`.
    static let global_cream = Rswift.ColorResource(bundle: R.hostingBundle, name: "global_cream")
    /// Color `global_yellow`.
    static let global_yellow = Rswift.ColorResource(bundle: R.hostingBundle, name: "global_yellow")
    /// Color `gray`.
    static let gray = Rswift.ColorResource(bundle: R.hostingBundle, name: "gray")
    /// Color `light_gray`.
    static let light_gray = Rswift.ColorResource(bundle: R.hostingBundle, name: "light_gray")
    /// Color `off_black`.
    static let off_black = Rswift.ColorResource(bundle: R.hostingBundle, name: "off_black")
    /// Color `tab_bar_inactive`.
    static let tab_bar_inactive = Rswift.ColorResource(bundle: R.hostingBundle, name: "tab_bar_inactive")
    /// Color `textfield_placeholder`.
    static let textfield_placeholder = Rswift.ColorResource(bundle: R.hostingBundle, name: "textfield_placeholder")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "drop_shadow", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func drop_shadow(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.drop_shadow, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "error_red", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func error_red(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.error_red, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "global_blue", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func global_blue(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.global_blue, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "global_cream", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func global_cream(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.global_cream, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "global_yellow", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func global_yellow(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.global_yellow, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "gray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func gray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.gray, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "light_gray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func light_gray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.light_gray, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "off_black", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func off_black(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.off_black, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "tab_bar_inactive", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func tab_bar_inactive(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.tab_bar_inactive, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "textfield_placeholder", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func textfield_placeholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.textfield_placeholder, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "drop_shadow", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func drop_shadow(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.drop_shadow.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "error_red", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func error_red(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.error_red.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "global_blue", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func global_blue(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.global_blue.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "global_cream", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func global_cream(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.global_cream.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "global_yellow", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func global_yellow(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.global_yellow.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "gray", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func gray(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.gray.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "light_gray", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func light_gray(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.light_gray.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "off_black", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func off_black(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.off_black.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "tab_bar_inactive", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func tab_bar_inactive(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.tab_bar_inactive.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "textfield_placeholder", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func textfield_placeholder(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.textfield_placeholder.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 4 images.
  struct image {
    /// Image `event_logo`.
    static let event_logo = Rswift.ImageResource(bundle: R.hostingBundle, name: "event_logo")
    /// Image `navigation_bar_background`.
    static let navigation_bar_background = Rswift.ImageResource(bundle: R.hostingBundle, name: "navigation_bar_background")
    /// Image `subtract_bottom`.
    static let subtract_bottom = Rswift.ImageResource(bundle: R.hostingBundle, name: "subtract_bottom")
    /// Image `subtract_top`.
    static let subtract_top = Rswift.ImageResource(bundle: R.hostingBundle, name: "subtract_top")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "event_logo", bundle: ..., traitCollection: ...)`
    static func event_logo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.event_logo, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "navigation_bar_background", bundle: ..., traitCollection: ...)`
    static func navigation_bar_background(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.navigation_bar_background, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "subtract_bottom", bundle: ..., traitCollection: ...)`
    static func subtract_bottom(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.subtract_bottom, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "subtract_top", bundle: ..., traitCollection: ...)`
    static func subtract_top(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.subtract_top, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Login"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 2 nibs.
  struct nib {
    /// Nib `EventResultCell`.
    static let eventResultCell = _R.nib._EventResultCell()
    /// Nib `EventTextField`.
    static let eventTextField = _R.nib._EventTextField()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "EventResultCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.eventResultCell) instead")
    static func eventResultCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.eventResultCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "EventTextField", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.eventTextField) instead")
    static func eventTextField(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.eventTextField)
    }
    #endif

    static func eventResultCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> EventResultCell? {
      return R.nib.eventResultCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? EventResultCell
    }

    static func eventTextField(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIControl? {
      return R.nib.eventTextField.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIControl
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `EventResultCell`.
    static let eventResultCell: Rswift.ReuseIdentifier<EventResultCell> = Rswift.ReuseIdentifier(identifier: "EventResultCell")

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 10 localization keys.
    struct localizable {
      /// Value: Add Event
      static let commonButtonAddEvent = Rswift.StringResource(key: "common.button.add.event", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Calendar Event App
      static let loginScreenTitle = Rswift.StringResource(key: "login.screen.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Cancel
      static let alertCancel = Rswift.StringResource(key: "alert.cancel", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Email
      static let signInEmail = Rswift.StringResource(key: "sign.in.email", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Event List
      static let eventResultTitle = Rswift.StringResource(key: "event.result.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Login
      static let loginTitle = Rswift.StringResource(key: "login.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: OK
      static let alertOk = Rswift.StringResource(key: "alert.ok", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Password
      static let signInPassword = Rswift.StringResource(key: "sign.in.password", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Password needs to have 1 uppercase letter, 1 number, and be a minimum of 8 characters.
      static let loginWrongPassword = Rswift.StringResource(key: "login.wrong.password", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Please enter valid email.
      static let loginInvalidEmail = Rswift.StringResource(key: "login.invalid.email", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Add Event
      static func commonButtonAddEvent(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("common.button.add.event", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "common.button.add.event"
        }

        return NSLocalizedString("common.button.add.event", bundle: bundle, comment: "")
      }

      /// Value: Calendar Event App
      static func loginScreenTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("login.screen.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "login.screen.title"
        }

        return NSLocalizedString("login.screen.title", bundle: bundle, comment: "")
      }

      /// Value: Cancel
      static func alertCancel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("alert.cancel", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "alert.cancel"
        }

        return NSLocalizedString("alert.cancel", bundle: bundle, comment: "")
      }

      /// Value: Email
      static func signInEmail(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("sign.in.email", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "sign.in.email"
        }

        return NSLocalizedString("sign.in.email", bundle: bundle, comment: "")
      }

      /// Value: Event List
      static func eventResultTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("event.result.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "event.result.title"
        }

        return NSLocalizedString("event.result.title", bundle: bundle, comment: "")
      }

      /// Value: Login
      static func loginTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("login.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "login.title"
        }

        return NSLocalizedString("login.title", bundle: bundle, comment: "")
      }

      /// Value: OK
      static func alertOk(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("alert.ok", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "alert.ok"
        }

        return NSLocalizedString("alert.ok", bundle: bundle, comment: "")
      }

      /// Value: Password
      static func signInPassword(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("sign.in.password", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "sign.in.password"
        }

        return NSLocalizedString("sign.in.password", bundle: bundle, comment: "")
      }

      /// Value: Password needs to have 1 uppercase letter, 1 number, and be a minimum of 8 characters.
      static func loginWrongPassword(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("login.wrong.password", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "login.wrong.password"
        }

        return NSLocalizedString("login.wrong.password", bundle: bundle, comment: "")
      }

      /// Value: Please enter valid email.
      static func loginInvalidEmail(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("login.invalid.email", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "login.invalid.email"
        }

        return NSLocalizedString("login.invalid.email", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib {
    struct _EventResultCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = EventResultCell

      let bundle = R.hostingBundle
      let identifier = "EventResultCell"
      let name = "EventResultCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> EventResultCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? EventResultCell
      }

      fileprivate init() {}
    }

    struct _EventTextField: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "EventTextField"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIControl? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIControl
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try eventResult.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try login.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct eventResult: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let eventResultViewController = StoryboardViewControllerResource<EventResultViewController>(identifier: "EventResultViewController")
      let name = "EventResult"

      func eventResultViewController(_: Void = ()) -> EventResultViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: eventResultViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
          if UIKit.UIColor(named: "off_black", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Color named 'off_black' is used in storyboard 'EventResult', but couldn't be loaded.") }
        }
        if _R.storyboard.eventResult().eventResultViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'eventResultViewController' could not be loaded from storyboard 'EventResult' as 'EventResultViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct login: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = LoginViewController

      let bundle = R.hostingBundle
      let loginViewController = StoryboardViewControllerResource<LoginViewController>(identifier: "LoginViewController")
      let name = "Login"

      func loginViewController(_: Void = ()) -> LoginViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loginViewController)
      }

      static func validate() throws {
        if UIKit.UIImage(named: "event_logo", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'event_logo' is used in storyboard 'Login', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.login().loginViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loginViewController' could not be loaded from storyboard 'Login' as 'LoginViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
