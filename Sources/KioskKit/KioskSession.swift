import AutomaticAssessmentConfiguration

public final class KioskSession: NSObject {
    private let underlyingSession: AEAssessmentSession
    
    public var configuration: KioskConfiguration
    public var participantApplications: [KioskParticipantApplication: KioskParticipantConfiguration] = [:]
    public var isActive: Bool {
        underlyingSession.isActive
    }
    
    private var delegate: AEAssessmentSessionDelegate?
    private weak var sessionDelegate: KioskSessionDelegate?
    
    internal init(configuration: KioskConfiguration, delegate: KioskSessionDelegate? = nil) {
        self.configuration = configuration
        self.underlyingSession = AEAssessmentSession(configuration: configuration.underlyingConfiguration)
        super.init()
        self.delegate = self
        self.sessionDelegate = delegate
    }
}

public extension KioskSession {
    func begin() {
        underlyingSession.begin()
    }
    
    func end() {
        underlyingSession.end()
    }
}

public extension KioskSession {
    func disableHostNetwork(_ flag: Bool) {
        configuration.underlyingConfiguration.mainParticipantConfiguration.allowsNetworkAccess = flag
    }
    
    func set(configuration newConfiguration: KioskConfiguration) {
        configuration = newConfiguration
    }
    
    func resetConfiguration() {
        configuration = KioskConfiguration()
    }
}

public extension KioskSession {
    func participants() -> [KioskParticipantApplication] {
        Array(participantApplications.keys)
    }
    
    func configuration(for participant: KioskParticipantApplication) -> KioskParticipantConfiguration? {
        participantApplications[participant]
    }
    
    func add(participant: KioskParticipantApplication, with participantConfiguration: KioskParticipantConfiguration) {
        configuration.set(configuration: participantConfiguration, for: participant)
    }
    
    func remove(participant: KioskParticipantApplication) {
        configuration.remove(participant: participant) {
            participantApplications.removeValue(forKey: participant)
        }
    }
}

extension KioskSession: AEAssessmentSessionDelegate {
    public func assessmentSessionDidBegin(_ session: AEAssessmentSession) {
        sessionDelegate?.sessionDidBegin(session: self)
    }

    public func assessmentSession(_ session: AEAssessmentSession, failedToBeginWithError error: Error) {
        sessionDelegate?.sessionFailedToBegin(session: self, reson: .failedToStart(error))
    }
    
    public func assessmentSession(_ session: AEAssessmentSession, wasInterruptedWithError error: Error) {
        sessionDelegate?.sessionDidEnd(session: self, reason: .interruption(error))
    }

    public func assessmentSessionDidEnd(_ session: AEAssessmentSession) {
        sessionDelegate?.sessionDidEnd(session: self, reason: .end)
    }

    @available(macOS 12.0, *)
    public func assessmentSessionDidUpdate(_ session: AEAssessmentSession) {
        sessionDelegate?.sessionDidUpdate(configuration: configuration)
    }

    @available(macOS 12.0, *)
    public func assessmentSession(_ session: AEAssessmentSession, failedToUpdateTo configuration: AEAssessmentConfiguration, error: Error) {
        sessionDelegate?.sessionFailedToUpdate(session: self, to: KioskConfiguration(configuration: configuration), reson: .failure(error))
    }
}
