#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSCAMERA_EXTENDEDPROP_ROI_INFO.ahk" { KSCAMERA_EXTENDEDPROP_ROI_INFO }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_ROI_EXPOSURE {
    #StructPack 8

    ROIInfo : KSCAMERA_EXTENDEDPROP_ROI_INFO

    Reserved : Int64

}
