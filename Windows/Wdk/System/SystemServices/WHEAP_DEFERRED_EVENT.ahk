#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEAP_DEFERRED_EVENT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {LIST_ENTRY}
     */
    ListEntry{
        get {
            if(!this.HasProp("__ListEntry"))
                this.__ListEntry := LIST_ENTRY(0, this)
            return this.__ListEntry
        }
    }

    /**
     * @type {Pointer<WHEA_EVENT_LOG_ENTRY>}
     */
    WheaEventLogEntry {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
