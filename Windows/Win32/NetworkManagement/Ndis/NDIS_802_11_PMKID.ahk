#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BSSID_INFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_PMKID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BSSIDInfoCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<BSSID_INFO>}
     */
    BSSIDInfo{
        get {
            if(!this.HasProp("__BSSIDInfoProxyArray"))
                this.__BSSIDInfoProxyArray := Win32FixedArray(this.ptr + 8, 8, BSSID_INFO, "")
            return this.__BSSIDInfoProxyArray
        }
    }
}
