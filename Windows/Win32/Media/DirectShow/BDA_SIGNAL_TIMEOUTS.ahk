#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_SIGNAL_TIMEOUTS {
    #StructPack 4

    ulCarrierTimeoutMs : UInt32

    ulScanningTimeoutMs : UInt32

    ulTuningTimeoutMs : UInt32

}
