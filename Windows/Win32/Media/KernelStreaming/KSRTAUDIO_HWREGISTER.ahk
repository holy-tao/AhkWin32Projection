#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSRTAUDIO_HWREGISTER {
    #StructPack 8

    Register : IntPtr

    Width : UInt32

    Numerator : Int64

    Denominator : Int64

    Accuracy : UInt32

}
