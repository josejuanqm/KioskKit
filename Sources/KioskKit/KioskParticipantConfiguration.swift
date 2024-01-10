import AutomaticAssessmentConfiguration

public final class KioskParticipantConfiguration {
    public class var withNetworkAccess: KioskParticipantConfiguration {
        KioskParticipantConfiguration(allowsNetworkAccess: true)
    }
    
    public class var withoutNetworkAccess: KioskParticipantConfiguration {
        KioskParticipantConfiguration(allowsNetworkAccess: true)
    }
    
    let underlyingConfiguration: AEAssessmentParticipantConfiguration
    
    public init(allowsNetworkAccess: Bool) {
        self.underlyingConfiguration = AEAssessmentParticipantConfiguration()
        self.underlyingConfiguration.allowsNetworkAccess = allowsNetworkAccess
    }
}
