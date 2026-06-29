#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSTIME {
    #StructPack 8

    Time : Int64

    Numerator : UInt32

    Denominator : UInt32

}
