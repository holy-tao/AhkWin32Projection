#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class CKCL_LISTHEAD extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<CKCL_DATA>}
     */
    LogEventListHead {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {HANDLE}
     */
    Heap{
        get {
            if(!this.HasProp("__Heap"))
                this.__Heap := HANDLE(this.ptr + 8)
            return this.__Heap
        }
    }
}
