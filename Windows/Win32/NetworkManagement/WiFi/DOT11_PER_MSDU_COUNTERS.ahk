#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PER_MSDU_COUNTERS {
    #StructPack 4

    uTransmittedFragmentCount : UInt32

    uRetryCount : UInt32

    uRTSSuccessCount : UInt32

    uRTSFailureCount : UInt32

    uACKFailureCount : UInt32

}
