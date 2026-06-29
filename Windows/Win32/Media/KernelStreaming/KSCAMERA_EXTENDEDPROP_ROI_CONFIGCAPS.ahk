#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_ROI_CONFIGCAPS {
    #StructPack 8

    ControlId : UInt32

    MaxNumberOfROIs : UInt32

    Capability : Int64

}
