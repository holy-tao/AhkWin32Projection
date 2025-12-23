#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_RATE_SET.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_REALTIME_CONNECTION_QUALITY_LINK_INFO extends Win32Struct
{
    static sizeof => 272

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ucLinkID {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulChannelCenterFrequencyMhz {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ulBandwidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    lRssi {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {WLAN_RATE_SET}
     */
    wlanRateSet{
        get {
            if(!this.HasProp("__wlanRateSet"))
                this.__wlanRateSet := WLAN_RATE_SET(16, this)
            return this.__wlanRateSet
        }
    }
}
