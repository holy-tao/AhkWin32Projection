#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HEAP_MEMORY_USAGE_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class HEAP_MEMORY_USAGE_INFORMATION extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    EntryCount {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {HEAP_MEMORY_USAGE_ENTRY}
     */
    Entries {
        get {
            if(!this.HasProp("__EntriesProxyArray"))
                this.__EntriesProxyArray := Win32FixedArray(this.ptr + 16, 1, HEAP_MEMORY_USAGE_ENTRY, "")
            return this.__EntriesProxyArray
        }
    }
}
