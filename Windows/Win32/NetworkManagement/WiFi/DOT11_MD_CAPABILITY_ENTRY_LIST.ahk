#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_MULTI_DOMAIN_CAPABILITY_ENTRY.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_MD_CAPABILITY_ENTRY_LIST extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

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
     * @type {DOT11_MULTI_DOMAIN_CAPABILITY_ENTRY}
     */
    dot11MDCapabilityEntry {
        get {
            if(!this.HasProp("__dot11MDCapabilityEntryProxyArray"))
                this.__dot11MDCapabilityEntryProxyArray := Win32FixedArray(this.ptr + 8, 1, DOT11_MULTI_DOMAIN_CAPABILITY_ENTRY, "")
            return this.__dot11MDCapabilityEntryProxyArray
        }
    }
}
