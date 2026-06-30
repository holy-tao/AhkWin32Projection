#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KE_PROCESSOR_CHANGE_NOTIFY_STATE.ahk
#Include ..\..\..\Win32\Foundation\NTSTATUS.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class KE_PROCESSOR_CHANGE_NOTIFY_CONTEXT extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {KE_PROCESSOR_CHANGE_NOTIFY_STATE}
     */
    State {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NtNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {NTSTATUS}
     */
    Status {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    ProcNumber {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
