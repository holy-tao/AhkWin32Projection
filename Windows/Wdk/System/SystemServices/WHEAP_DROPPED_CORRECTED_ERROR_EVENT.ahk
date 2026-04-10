#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_TYPE.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEAP_DROPPED_CORRECTED_ERROR_EVENT extends Win32Struct {
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
     * @type {WHEA_ERROR_SOURCE_TYPE}
     */
    ErrorSourceType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ErrorSourceId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
