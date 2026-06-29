#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_ROI_ISPCONTROLHEADER {
    #StructPack 8

    Size : UInt32

    ControlCount : UInt32

    Reserved : Int64

}
