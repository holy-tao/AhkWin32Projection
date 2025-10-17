#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WDIAG_IHV_WLAN_ID extends Win32Struct
{
    static sizeof => 560

    static packingSize => 8

    /**
     * @type {String}
     */
    strProfileName {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * @type {DOT11_SSID}
     */
    Ssid{
        get {
            if(!this.HasProp("__Ssid"))
                this.__Ssid := DOT11_SSID(512, this)
            return this.__Ssid
        }
    }

    /**
     * @type {Integer}
     */
    BssType {
        get => NumGet(this, 548, "int")
        set => NumPut("int", value, this, 548)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }

    /**
     * @type {Integer}
     */
    dwReasonCode {
        get => NumGet(this, 556, "uint")
        set => NumPut("uint", value, this, 556)
    }
}
