// Generated using SwiftGen, by O.Halligon, edited by Jeddawy — https://github.com/SwiftGen/SwiftGen
import Foundation
// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length
// swiftlint:disable identifier_name line_length type_body_length
internal enum L10n {
  /// Asr
  internal static var asr: String { return L10n.tr("Localizable", "asr") }
  /// Change Location
  internal static var changeLocation: String { return L10n.tr("Localizable", "changeLocation") }
  /// Dhour
  internal static var dhour: String { return L10n.tr("Localizable", "dhour") }
  /// Done
  internal static var done: String { return L10n.tr("Localizable", "done") }
  /// Egyptian General Authority of Survey
  internal static var egyptian: String { return L10n.tr("Localizable", "egyptian") }
  /// Error
  internal static var error: String { return L10n.tr("Localizable", "error") }
  /// Fajr
  internal static var fajr: String { return L10n.tr("Localizable", "fajr") }
  /// Union Organization Islamic de France
  internal static var france: String { return L10n.tr("Localizable", "france") }
  /// Gulf Region
  internal static var gulf: String { return L10n.tr("Localizable", "gulf") }
  /// Hanfi
  internal static var hanfi: String { return L10n.tr("Localizable", "hanfi") }
  /// Isha
  internal static var isha: String { return L10n.tr("Localizable", "isha") }
  /// Islamic Society of North America (ISNA)
  internal static var isna: String { return L10n.tr("Localizable", "ISNA") }
  /// Uiversity of Islamic Sciences, Karachi
  internal static var karachi: String { return L10n.tr("Localizable", "karachi") }
  /// Kuwait
  internal static var kuwait: String { return L10n.tr("Localizable", "kuwait") }
  /// Majrib
  internal static var majirb: String { return L10n.tr("Localizable", "majirb") }
  /// Umm Al-Qura University
  internal static var makkah: String { return L10n.tr("Localizable", "makkah") }
  /// No Matching Addresses Found
  internal static var noMatchingAddresses: String { return L10n.tr("Localizable", "noMatchingAddresses") }
  /// Please Turn On Location Services
  internal static var pleaseTurnOnLocation: String { return L10n.tr("Localizable", "pleaseTurnOnLocation") }
  /// Prayer
  internal static var prayer: String { return L10n.tr("Localizable", "prayer") }
  /// Qatar
  internal static var qatar: String { return L10n.tr("Localizable", "qatar") }
  /// Prayer Time
  internal static var salaTime: String { return L10n.tr("Localizable", "salaTime") }
  /// Shafii
  internal static var shafii: String { return L10n.tr("Localizable", "shafii") }
  /// Majlis Ugama Islam Singapura
  internal static var singapore: String { return L10n.tr("Localizable", "singapore") }
  /// Sorry
  internal static var sorry: String { return L10n.tr("Localizable", "sorry") }
  /// Sound El-Haram
  internal static var soundElHaram: String { return L10n.tr("Localizable", "soundElHaram") }
  /// Sound 1
  internal static var soundOne: String { return L10n.tr("Localizable", "soundOne") }
  /// Without Sound?
  internal static var soundSlient: String { return L10n.tr("Localizable", "soundSlient") }
  /// Sound 3
  internal static var soundThree: String { return L10n.tr("Localizable", "soundThree") }
  /// Choose Azan Sound
  internal static var soundTitle: String { return L10n.tr("Localizable", "soundTitle") }
  /// Sound 2
  internal static var soundTwo: String { return L10n.tr("Localizable", "soundTwo") }
  /// Stop Sound
  internal static var stop: String { return L10n.tr("Localizable", "stop") }
  /// Submit
  internal static var submit: String { return L10n.tr("Localizable", "submit") }
  /// Time
  internal static var time: String { return L10n.tr("Localizable", "time") }
  /// Time For
  internal static var timeFor: String { return L10n.tr("Localizable", "timeFor") }
  /// Diyanet İşleri Başkanlığı, Turkey
  internal static var turkey: String { return L10n.tr("Localizable", "turkey") }
  /// Unable to Find Address for Location
  internal static var unableToFind: String { return L10n.tr("Localizable", "unableToFind") }
  /// Muslim World League
  internal static var worldLeague: String { return L10n.tr("Localizable", "worldLeague") }
}
// swiftlint:enable identifier_name line_length type_body_length
extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: PrivateBundle.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
private final class BundleToken {}
