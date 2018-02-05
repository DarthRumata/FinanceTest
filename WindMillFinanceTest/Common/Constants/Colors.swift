// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSColor
  typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable operator_usage_whitespace
extension Color {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
// swiftlint:enable operator_usage_whitespace

// swiftlint:disable identifier_name line_length type_body_length
struct ColorName {
  let rgbaValue: UInt32
  var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#be8e43"></span>
  /// Alpha: 100% <br/> (0xbe8e43ff)
  static let darkTan = ColorName(rgbaValue: 0xbe8e43ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e13593"></span>
  /// Alpha: 100% <br/> (0xe13593ff)
  static let darkishPink = ColorName(rgbaValue: 0xe13593ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#6b1766"></span>
  /// Alpha: 100% <br/> (0x6b1766ff)
  static let darkishPurple = ColorName(rgbaValue: 0x6b1766ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#886a46"></span>
  /// Alpha: 100% <br/> (0x886a46ff)
  static let dirt = ColorName(rgbaValue: 0x886a46ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#4a4a4a"></span>
  /// Alpha: 100% <br/> (0x4a4a4aff)
  static let greyishBrown = ColorName(rgbaValue: 0x4a4a4aff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#c2207e"></span>
  /// Alpha: 100% <br/> (0xc2207eff)
  static let lipstick = ColorName(rgbaValue: 0xc2207eff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#1a7a35"></span>
  /// Alpha: 100% <br/> (0x1a7a35ff)
  static let treeGreen = ColorName(rgbaValue: 0x1a7a35ff)
}
// swiftlint:enable identifier_name line_length type_body_length

extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}
