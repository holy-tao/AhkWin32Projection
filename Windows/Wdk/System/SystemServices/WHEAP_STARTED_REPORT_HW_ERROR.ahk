#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_ERROR_PACKET_V2.ahk" { WHEA_ERROR_PACKET_V2 }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_STARTED_REPORT_HW_ERROR {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    ErrorPacket : WHEA_ERROR_PACKET_V2.Ptr

}
