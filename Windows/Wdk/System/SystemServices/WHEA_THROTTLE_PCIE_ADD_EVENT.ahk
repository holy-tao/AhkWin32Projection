#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk
#Include ..\..\..\Win32\Foundation\NTSTATUS.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_THROTTLE_PCIE_ADD_EVENT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    WheaEventLogEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Address {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Mask {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {BOOLEAN}
     */
    Updated {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * @type {NTSTATUS}
     */
    Status {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
