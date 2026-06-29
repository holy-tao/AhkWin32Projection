#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_ROI_ISPCONTROL {
    #StructPack 4

    ControlId : UInt32

    ROICount : UInt32

    Result : UInt32

    Reserved : UInt32

}
