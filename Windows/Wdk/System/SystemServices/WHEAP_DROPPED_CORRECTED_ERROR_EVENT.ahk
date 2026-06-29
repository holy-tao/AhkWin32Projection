#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_TYPE.ahk" { WHEA_ERROR_SOURCE_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_DROPPED_CORRECTED_ERROR_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    ErrorSourceType : WHEA_ERROR_SOURCE_TYPE

    ErrorSourceId : UInt32

}
