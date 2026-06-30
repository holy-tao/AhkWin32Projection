#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_SSID_LIST extends Win32Struct {
    static sizeof => 48

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
    uNumOfEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    uTotalNumOfEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {DOT11_SSID}
     */
    SSIDs {
        get {
            if(!this.HasProp("__SSIDsProxyArray"))
                this.__SSIDsProxyArray := Win32FixedArray(this.ptr + 12, 1, DOT11_SSID, "")
            return this.__SSIDsProxyArray
        }
    }
}
