import AutomaticAssessmentConfiguration

public final class KioskParticipantApplication {
    public enum ApplicationBundleId {
        case some(String)
        case AppStore
        case AppleStore
        case Books
        case Calculator
        case Calendar
        case Camera
        case Clips
        case Clock
        case CodeScanner
        case Compass
        case Contacts
        case FaceTime
        case Files
        case FindMy
        case Fitness
        case Freeform
        case GarageBand
        case Health
        case Home
        case iCloudDrive
        case iMovie
        case iTunesStore
        case Journal
        case Keynote
        case Magnifier
        case Mail
        case Maps
        case Measure
        case Messages
        case Music
        case News
        case Notes
        case Numbers
        case Pages
        case Phone
        case PhotoBooth
        case Photos
        case Podcasts
        case Reminders
        case Safari
        case Settings
        case Shortcuts
        case Stocks
        case SwiftPlaygrounds
        case Tips
        case Translate
        case TV
        case VoiceMemos
        case Wallet
        case Watch
        case Weather
        
        
        var rawValue: String {
            switch self {
            case .some(let string):
                return string
            case .AppStore: return "com.apple.AppStore"
            case .AppleStore: return "com.apple.store.Jolly"
            case .Books: return "com.apple.iBooks"
            case .Calculator: return "com.apple.calculator"
            case .Calendar: return "com.apple.mobilecal"
            case .Camera: return "com.apple.camera"
            case .Clips: return "com.apple.clips"
            case .Clock: return "com.apple.mobiletimer"
            case .CodeScanner: return "com.apple.BarcodeScanner"
            case .Compass: return "com.apple.compass"
            case .Contacts: return "com.apple.MobileAddressBook"
            case .FaceTime: return "com.apple.facetime"
            case .Files: return "com.apple.DocumentsApp"
            case .FindMy: return "com.apple.findmy"
            case .Fitness: return "com.apple.Fitness"
            case .Freeform: return "com.apple.freeform"
            case .GarageBand: return "com.apple.mobilegarageband"
            case .Health: return "com.apple.Health"
            case .Home: return "com.apple.Home"
            case .iCloudDrive: return "com.apple.iCloudDriveApp"
            case .iMovie: return "com.apple.iMovie"
            case .iTunesStore: return "com.apple.MobileStore"
            case .Journal: return "com.apple.journal"
            case .Keynote: return "com.apple.Keynote"
            case .Magnifier: return "com.apple.Magnifier"
            case .Mail: return "com.apple.mobilemail"
            case .Maps: return "com.apple.Maps"
            case .Measure: return "com.apple.measure"
            case .Messages: return "com.apple.MobileSMS"
            case .Music: return "com.apple.Music"
            case .News: return "com.apple.news"
            case .Notes: return "com.apple.mobilenotes"
            case .Numbers: return "com.apple.Numbers"
            case .Pages: return "com.apple.Pages"
            case .Phone: return "com.apple.mobilephone"
            case .PhotoBooth: return "com.apple.Photo-Booth"
            case .Photos: return "com.apple.mobileslideshow"
            case .Podcasts: return "com.apple.podcasts"
            case .Reminders: return "com.apple.reminders"
            case .Safari: return "com.apple.mobilesafari"
            case .Settings: return "com.apple.Preferences"
            case .Shortcuts: return "com.apple.shortcuts"
            case .Stocks: return "com.apple.stocks"
            case .SwiftPlaygrounds: return "com.apple.Playgrounds"
            case .Tips: return "com.apple.tips"
            case .Translate: return "com.apple.Translate"
            case .TV: return "com.apple.tv"
            case .VoiceMemos: return "com.apple.VoiceMemos"
            case .Wallet: return "com.apple.Passbook"
            case .Watch: return "com.apple.Bridge"
            case .Weather: return "com.apple.weather"
            }
        }
    }
    
    let underlyingApplication: AEAssessmentApplication
    let bundleId: ApplicationBundleId
    
    public init(bundleId: ApplicationBundleId, teamIdentifier: String? = nil, requiresSignatureValidation: Bool = true) {
        self.bundleId = bundleId
        guard let teamIdentifier else {
            underlyingApplication = AEAssessmentApplication(bundleIdentifier: bundleId.rawValue)
            underlyingApplication.requiresSignatureValidation = requiresSignatureValidation
            return
        }
        
        underlyingApplication = AEAssessmentApplication(bundleIdentifier: bundleId.rawValue, teamIdentifier: teamIdentifier)
        underlyingApplication.requiresSignatureValidation = requiresSignatureValidation
    }
}

extension KioskParticipantApplication: Equatable, Hashable {
    public static func == (lhs: KioskParticipantApplication, rhs: KioskParticipantApplication) -> Bool {
        lhs.underlyingApplication == rhs.underlyingApplication
    }
    
    public var hashValue: Int {
        underlyingApplication.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(underlyingApplication)
    }
}
