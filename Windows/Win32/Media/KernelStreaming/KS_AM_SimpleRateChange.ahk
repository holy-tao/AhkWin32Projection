#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_AM_SimpleRateChange {
    #StructPack 8

    StartTime : Int64

    Rate : Int32

}
