#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_MAC_FRAME_STATISTICS {
    #StructPack 8

    ullTransmittedFrameCount : Int64

    ullReceivedFrameCount : Int64

    ullTransmittedFailureFrameCount : Int64

    ullReceivedFailureFrameCount : Int64

    ullWEPExcludedCount : Int64

    ullTKIPLocalMICFailures : Int64

    ullTKIPReplays : Int64

    ullTKIPICVErrorCount : Int64

    ullCCMPReplays : Int64

    ullCCMPDecryptErrors : Int64

    ullWEPUndecryptableCount : Int64

    ullWEPICVErrorCount : Int64

    ullDecryptSuccessCount : Int64

    ullDecryptFailureCount : Int64

}
