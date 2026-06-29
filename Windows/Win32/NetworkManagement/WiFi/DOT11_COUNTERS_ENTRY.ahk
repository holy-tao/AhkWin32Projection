#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_COUNTERS_ENTRY {
    #StructPack 4

    uTransmittedFragmentCount : UInt32

    uMulticastTransmittedFrameCount : UInt32

    uFailedCount : UInt32

    uRetryCount : UInt32

    uMultipleRetryCount : UInt32

    uFrameDuplicateCount : UInt32

    uRTSSuccessCount : UInt32

    uRTSFailureCount : UInt32

    uACKFailureCount : UInt32

    uReceivedFragmentCount : UInt32

    uMulticastReceivedFrameCount : UInt32

    uFCSErrorCount : UInt32

    uTransmittedFrameCount : UInt32

}
