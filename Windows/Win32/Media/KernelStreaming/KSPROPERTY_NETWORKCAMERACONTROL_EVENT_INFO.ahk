#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSCAMERA_METADATA_ITEMHEADER.ahk" { KSCAMERA_METADATA_ITEMHEADER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_NETWORKCAMERACONTROL_EVENT_INFO {
    #StructPack 4

    Header : KSCAMERA_METADATA_ITEMHEADER

    EventFilter : WCHAR[1]

}
