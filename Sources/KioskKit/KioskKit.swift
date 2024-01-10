// The Swift Programming Language
// https://docs.swift.org/swift-book

import AutomaticAssessmentConfiguration

public final class KioskKit {
    public static func createSession(with configuration: KioskConfiguration) -> KioskSession {
        KioskSession(configuration: configuration)
    }
}
