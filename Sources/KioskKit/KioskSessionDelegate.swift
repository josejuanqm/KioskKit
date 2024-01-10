import AutomaticAssessmentConfiguration

public protocol KioskSessionDelegate: AnyObject {
    func sessionDidBegin(session: KioskSession)
    func sessionFailedToBegin(session: KioskSession, reson: KioskSessionTerminationReason)
    func sessionDidEnd(session: KioskSession, reason: KioskSessionTerminationReason)
    func sessionDidUpdate(configuration: KioskConfiguration)
    func sessionFailedToUpdate(session: KioskSession, to configuration: KioskConfiguration, reson: KioskSessionTerminationReason)
}
