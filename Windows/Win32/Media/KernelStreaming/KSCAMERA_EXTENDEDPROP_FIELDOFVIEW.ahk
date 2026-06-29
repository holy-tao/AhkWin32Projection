#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_FIELDOFVIEW {
    #StructPack 4

    NormalizedFocalLengthX : UInt32

    NormalizedFocalLengthY : UInt32

    Flag : UInt32

    Reserved : UInt32

}
