// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  enum NetIncome {
    /// NET INCOME YTD
    static let caption = L10n.tr("Localizable", "net_income.caption")
  }

  enum NetWorth {
    /// TOTAL NET WORTH
    static let caption = L10n.tr("Localizable", "net_worth.caption")
  }

  enum Performance {
    /// Performance
    static let caption = L10n.tr("Localizable", "performance.caption")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
