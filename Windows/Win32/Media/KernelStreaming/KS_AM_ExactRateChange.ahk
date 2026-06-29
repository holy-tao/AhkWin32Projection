#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_AM_ExactRateChange {
    #StructPack 8

    OutputZeroTime : Int64

    Rate : Int32

}
