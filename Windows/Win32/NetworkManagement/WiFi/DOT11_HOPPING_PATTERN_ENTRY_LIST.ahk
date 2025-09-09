#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_HOPPING_PATTERN_ENTRY.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_HOPPING_PATTERN_ENTRY_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uNumOfEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uTotalNumOfEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<DOT11_HOPPING_PATTERN_ENTRY>}
     */
    dot11HoppingPatternEntry{
        get {
            if(!this.HasProp("__dot11HoppingPatternEntryProxyArray"))
                this.__dot11HoppingPatternEntryProxyArray := Win32FixedArray(this.ptr + 8, 1, DOT11_HOPPING_PATTERN_ENTRY, "")
            return this.__dot11HoppingPatternEntryProxyArray
        }
    }
}
