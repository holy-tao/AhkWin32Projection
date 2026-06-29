#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_CHANNEL_HINT.ahk
#Include .\DOT11_SSID.ahk
#Include .\DOT11_OFFLOAD_NETWORK.ahk
#Include .\DOT11_PHY_TYPE.ahk
#Include .\DOT11_CIPHER_ALGORITHM.ahk
#Include .\DOT11_AUTH_ALGORITHM.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_OFFLOAD_NETWORK_LIST_INFO extends Win32Struct {
    static sizeof => 100

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
    ulFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    FastScanPeriod {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    FastScanIterations {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    SlowScanPeriod {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    uNumOfEntries {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {DOT11_OFFLOAD_NETWORK}
     */
    offloadNetworkList {
        get {
            if(!this.HasProp("__offloadNetworkListProxyArray"))
                this.__offloadNetworkListProxyArray := Win32FixedArray(this.ptr + 24, 1, DOT11_OFFLOAD_NETWORK, "")
            return this.__offloadNetworkListProxyArray
        }
    }
}
