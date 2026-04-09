#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEAP_ACPI_TIMEOUT_EVENT extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    WheaEventLogEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {String}
     */
    TableType {
        get => StrGet(this.ptr + 8, 31, "UTF-8")
        set => StrPut(value, this.ptr + 8, 31, "UTF-8")
    }

    /**
     * @type {String}
     */
    TableRequest {
        get => StrGet(this.ptr + 40, 31, "UTF-8")
        set => StrPut(value, this.ptr + 40, 31, "UTF-8")
    }
}
