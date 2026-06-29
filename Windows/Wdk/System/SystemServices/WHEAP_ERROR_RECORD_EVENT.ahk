#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_ERROR_RECORD.ahk" { WHEA_ERROR_RECORD }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_ERROR_RECORD_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Record : WHEA_ERROR_RECORD.Ptr

}
