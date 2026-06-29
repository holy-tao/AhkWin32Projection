#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_EVCOMPENSATION {
    #StructPack 8

    Mode : UInt32

    Min : Int32

    Max : Int32

    Value : Int32

    Reserved : Int64

}
