#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk
#Include .\DOT11_CIPHER_ALGORITHM.ahk
#Include .\DOT11_AUTH_ALGORITHM.ahk
#Include .\DOT11_CHANNEL_HINT.ahk
#Include .\DOT11_PHY_TYPE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_OFFLOAD_NETWORK extends Win32Struct {
    static sizeof => 76

    static packingSize => 4

    /**
     * @type {DOT11_SSID}
     */
    Ssid {
        get {
            if(!this.HasProp("__Ssid"))
                this.__Ssid := DOT11_SSID(0, this)
            return this.__Ssid
        }
    }

    /**
     * @type {DOT11_CIPHER_ALGORITHM}
     */
    UnicastCipher {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {DOT11_AUTH_ALGORITHM}
     */
    AuthAlgo {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {DOT11_CHANNEL_HINT}
     */
    Dot11ChannelHints {
        get {
            if(!this.HasProp("__Dot11ChannelHintsProxyArray"))
                this.__Dot11ChannelHintsProxyArray := Win32FixedArray(this.ptr + 44, 4, DOT11_CHANNEL_HINT, "")
            return this.__Dot11ChannelHintsProxyArray
        }
    }
}
