#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class KQUEUE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<DISPATCHER_HEADER>}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {LIST_ENTRY}
     */
    EntryListHead{
        get {
            if(!this.HasProp("__EntryListHead"))
                this.__EntryListHead := LIST_ENTRY(8, this)
            return this.__EntryListHead
        }
    }

    /**
     * @type {Integer}
     */
    CurrentCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MaximumCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {LIST_ENTRY}
     */
    ThreadListHead{
        get {
            if(!this.HasProp("__ThreadListHead"))
                this.__ThreadListHead := LIST_ENTRY(32, this)
            return this.__ThreadListHead
        }
    }
}
