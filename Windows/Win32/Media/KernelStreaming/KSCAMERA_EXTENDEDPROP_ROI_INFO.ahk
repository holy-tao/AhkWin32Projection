#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_ROI_INFO {
    #StructPack 8

    Region : RECT

    Flags : Int64

    Weight : Int32

    RegionOfInterestType : Int32

}
