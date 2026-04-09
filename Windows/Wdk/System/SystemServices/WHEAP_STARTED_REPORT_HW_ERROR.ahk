#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHEA_ERROR_PACKET_V2.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEAP_STARTED_REPORT_HW_ERROR extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    WheaEventLogEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<WHEA_ERROR_PACKET_V2>}
     */
    ErrorPacket {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
