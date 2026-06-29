#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEAP_OSC_IMPLEMENTED extends Win32Struct {
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
     * @type {BOOLEAN}
     */
    OscImplemented {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    DebugChecked {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }
}
