#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KTIMER extends Win32Struct
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
     * @type {Integer}
     */
    DueTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {LIST_ENTRY}
     */
    TimerListEntry{
        get {
            if(!this.HasProp("__TimerListEntry"))
                this.__TimerListEntry := LIST_ENTRY(16, this)
            return this.__TimerListEntry
        }
    }

    /**
     * @type {Pointer<KDPC>}
     */
    Dpc {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Period {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
