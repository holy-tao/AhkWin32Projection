#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IO_STATUS_BLOCK64 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {NTSTATUS}
     */
    Status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    Pointer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Information {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
