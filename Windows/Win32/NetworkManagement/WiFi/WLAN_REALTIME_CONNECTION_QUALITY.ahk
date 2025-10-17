#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_RATE_SET.ahk
#Include .\WLAN_REALTIME_CONNECTION_QUALITY_LINK_INFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_REALTIME_CONNECTION_QUALITY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dot11PhyType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulLinkQuality {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ulRxRate {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ulTxRate {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {BOOL}
     */
    bIsMLOConnection {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ulNumLinks {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<WLAN_REALTIME_CONNECTION_QUALITY_LINK_INFO>}
     */
    linksInfo{
        get {
            if(!this.HasProp("__linksInfoProxyArray"))
                this.__linksInfoProxyArray := Win32FixedArray(this.ptr + 24, 1, WLAN_REALTIME_CONNECTION_QUALITY_LINK_INFO, "")
            return this.__linksInfoProxyArray
        }
    }
}
