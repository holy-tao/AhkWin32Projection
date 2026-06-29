#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PHY_FRAME_STATISTICS {
    #StructPack 8

    ullTransmittedFrameCount : Int64

    ullMulticastTransmittedFrameCount : Int64

    ullFailedCount : Int64

    ullRetryCount : Int64

    ullMultipleRetryCount : Int64

    ullMaxTXLifetimeExceededCount : Int64

    ullTransmittedFragmentCount : Int64

    ullRTSSuccessCount : Int64

    ullRTSFailureCount : Int64

    ullACKFailureCount : Int64

    ullReceivedFrameCount : Int64

    ullMulticastReceivedFrameCount : Int64

    ullPromiscuousReceivedFrameCount : Int64

    ullMaxRXLifetimeExceededCount : Int64

    ullFrameDuplicateCount : Int64

    ullReceivedFragmentCount : Int64

    ullPromiscuousReceivedFragmentCount : Int64

    ullFCSErrorCount : Int64

}
