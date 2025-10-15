#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\NTSTATUS.ahk

/**
 * @namespace Windows.Win32.System.IO
 * @version v4.0.30319
 */
class IO_STATUS_BLOCK extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {NTSTATUS}
     */
    Status{
        get {
            if(!this.HasProp("__Status"))
                this.__Status := NTSTATUS(this.ptr + 0)
            return this.__Status
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    Pointer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Information {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
