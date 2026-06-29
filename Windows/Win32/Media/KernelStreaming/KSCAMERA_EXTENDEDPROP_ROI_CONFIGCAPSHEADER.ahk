#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_ROI_CONFIGCAPSHEADER {
    #StructPack 8

    Size : UInt32

    ConfigCapCount : UInt32

    Reserved : Int64

}
