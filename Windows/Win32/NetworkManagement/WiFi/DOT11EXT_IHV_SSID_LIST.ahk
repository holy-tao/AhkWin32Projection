#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_IHV_SSID_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ulCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<DOT11_SSID>}
     */
    SSIDs{
        get {
            if(!this.HasProp("__SSIDsProxyArray"))
                this.__SSIDsProxyArray := Win32FixedArray(this.ptr + 8, 8, DOT11_SSID, "")
            return this.__SSIDsProxyArray
        }
    }
}
