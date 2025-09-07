#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDR64_BIND_CONTEXT.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class NDR64_BIND_AND_NOTIFY_EXTENSION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 6

    /**
     * @type {NDR64_BIND_CONTEXT}
     */
    Binding{
        get {
            if(!this.HasProp("__Binding"))
                this.__Binding := NDR64_BIND_CONTEXT(this.ptr + 0)
            return this.__Binding
        }
    }

    /**
     * @type {Integer}
     */
    NotifyIndex {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
