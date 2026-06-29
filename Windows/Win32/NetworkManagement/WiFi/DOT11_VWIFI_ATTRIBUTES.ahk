#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_VWIFI_COMBINATION.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_VWIFI_ATTRIBUTES extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    uTotalNumOfEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {DOT11_VWIFI_COMBINATION}
     */
    Combinations {
        get {
            if(!this.HasProp("__CombinationsProxyArray"))
                this.__CombinationsProxyArray := Win32FixedArray(this.ptr + 8, 1, DOT11_VWIFI_COMBINATION, "")
            return this.__CombinationsProxyArray
        }
    }
}
