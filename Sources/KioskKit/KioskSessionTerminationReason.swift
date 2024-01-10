public enum KioskSessionTerminationReason {
    case failedToStart(Error)
    case failure(Error)
    case interruption(Error)
    case end
}
