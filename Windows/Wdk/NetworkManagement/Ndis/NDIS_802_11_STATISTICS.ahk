#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_STATISTICS {
    #StructPack 8

    Length : UInt32

    TransmittedFragmentCount : Int64

    MulticastTransmittedFrameCount : Int64

    FailedCount : Int64

    RetryCount : Int64

    MultipleRetryCount : Int64

    RTSSuccessCount : Int64

    RTSFailureCount : Int64

    ACKFailureCount : Int64

    FrameDuplicateCount : Int64

    ReceivedFragmentCount : Int64

    MulticastReceivedFrameCount : Int64

    FCSErrorCount : Int64

    TKIPLocalMICFailures : Int64

    TKIPICVErrorCount : Int64

    TKIPCounterMeasuresInvoked : Int64

    TKIPReplays : Int64

    CCMPFormatErrors : Int64

    CCMPReplays : Int64

    CCMPDecryptErrors : Int64

    FourWayHandshakeFailures : Int64

    WEPUndecryptableCount : Int64

    WEPICVErrorCount : Int64

    DecryptSuccessCount : Int64

    DecryptFailureCount : Int64

}
