import AutomaticAssessmentConfiguration

#if os(iOS)
public typealias KioskAutoccorectMode = AEAssessmentConfiguration.AutocorrectMode
#endif

public struct KioskConfiguration {
#if os(iOS)
    // MARK: - Allowing accessibility
    /// A Boolean value that indicates whether to allow the speech-related accessibility features during an assessment.
    var allowsAccessibilitySpeech: Bool
    /// A Boolean value that indicates whether to allow the use of dictation during an assessment.
    var allowsDictation: Bool
    
    // MARK: - Allowing typing assistance
    var allowsContinuousPathKeyboard: Bool
    /// A Boolean value that indicates whether to allow Slide to Type to operate during an assessment.
    var allowsKeyboardShortcuts: Bool
    /// A Boolean value that indicates whether to allow keyboard shortcuts during an assessment.
    var allowsPredictiveKeyboard: Bool
    /// A Boolean value that indicates whether to enable the predictive keyboard during an assessment.
    var allowsPasswordAutoFill: Bool
    /// A Boolean value that indicates whether to allow password autofill during an assessment.
    
    // MARK: - Allowing corrections
    /// A Boolean value that indicates whether to allow spell check during an assessment.
    var allowsSpellCheck: Bool
    /// A Boolean value that indicates whether to allow Autocorrect during an assessment.
    var autocorrectMode: KioskAutoccorectMode
    /// The set of autocorrect features that you can enable during an assessment.

    // MARK: - Allowing handoff
    /// A Boolean value that indicates whether to allow Handoff during an assessment.
    var allowsActivityContinuation: Bool
#endif
    
    var underlyingConfiguration: AEAssessmentConfiguration {
        let configuration = AEAssessmentConfiguration()
#if os(iOS)
        configuration.autocorrectMode = autocorrectMode
        configuration.allowsSpellCheck = allowsSpellCheck
        configuration.allowsPredictiveKeyboard = allowsPredictiveKeyboard
        configuration.allowsKeyboardShortcuts = allowsKeyboardShortcuts
        configuration.allowsActivityContinuation = allowsActivityContinuation
        configuration.allowsDictation = allowsDictation
        configuration.allowsAccessibilitySpeech = allowsAccessibilitySpeech
        configuration.allowsPasswordAutoFill = allowsPasswordAutoFill
        configuration.allowsContinuousPathKeyboard = allowsContinuousPathKeyboard
#endif
        return configuration
    }
    
#if os(iOS)
    public init(
        autocorrectMode: AEAssessmentConfiguration.AutocorrectMode = [],
        allowsSpellCheck: Bool = false,
        allowsPredictiveKeyboard: Bool = false,
        allowsKeyboardShortcuts: Bool = false,
        allowsActivityContinuation: Bool = false,
        allowsDictation: Bool = false,
        allowsAccessibilitySpeech: Bool = false,
        allowsPasswordAutoFill: Bool = false,
        allowsContinuousPathKeyboard: Bool = false
    ) {
        self.autocorrectMode = autocorrectMode
        self.allowsSpellCheck = allowsSpellCheck
        self.allowsPredictiveKeyboard = allowsPredictiveKeyboard
        self.allowsKeyboardShortcuts = allowsKeyboardShortcuts
        self.allowsActivityContinuation = allowsActivityContinuation
        self.allowsDictation = allowsDictation
        self.allowsAccessibilitySpeech = allowsAccessibilitySpeech
        self.allowsPasswordAutoFill = allowsPasswordAutoFill
        self.allowsContinuousPathKeyboard = allowsContinuousPathKeyboard
    }
#elseif os(macOS)
    public init() {
        
    }
#endif
    
    init(configuration: AEAssessmentConfiguration) {
        
    }
}

extension KioskConfiguration {
    func set(configuration: KioskParticipantConfiguration, for participant: KioskParticipantApplication) {
        underlyingConfiguration.setConfiguration(configuration.underlyingConfiguration, for: participant.underlyingApplication)
    }
    
    func remove(participant: KioskParticipantApplication, completion: @convention(block) () -> Void) {
        underlyingConfiguration.remove(participant.underlyingApplication)
        completion()
    }
}
