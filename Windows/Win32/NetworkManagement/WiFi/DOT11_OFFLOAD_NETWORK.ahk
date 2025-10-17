#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk
#Include .\DOT11_CHANNEL_HINT.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_OFFLOAD_NETWORK extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {DOT11_SSID}
     */
    Ssid{
        get {
            if(!this.HasProp("__Ssid"))
                this.__Ssid := DOT11_SSID(0, this)
            return this.__Ssid
        }
    }

    /**
     * @type {Integer}
     */
    UnicastCipher {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    AuthAlgo {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Array<DOT11_CHANNEL_HINT>}
     */
    Dot11ChannelHints{
        get {
            if(!this.HasProp("__Dot11ChannelHintsProxyArray"))
                this.__Dot11ChannelHintsProxyArray := Win32FixedArray(this.ptr + 48, 4, DOT11_CHANNEL_HINT, "")
            return this.__Dot11ChannelHintsProxyArray
        }
    }
}
