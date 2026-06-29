#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_HEADER {
    #StructPack 8

    Version : UInt32

    PinId : UInt32

    Size : UInt32

    Result : UInt32

    Flags : Int64

    Capability : Int64

}
