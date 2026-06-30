#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\NTSTATUS.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_PSHED_PLUGIN_INIT_FAILED_EVENT extends Win32Struct {
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
     * @type {NTSTATUS}
     */
    Status {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
