#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_CONFIGURATION.ahk
#Include .\NDIS_802_11_NETWORK_INFRASTRUCTURE.ahk
#Include .\NDIS_802_11_CONFIGURATION_FH.ahk
#Include .\NDIS_802_11_SSID.ahk
#Include .\NDIS_802_11_NETWORK_TYPE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_WLAN_BSSID extends Win32Struct {
    static sizeof => 104

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    MacAddress {
        get {
            if(!this.HasProp("__MacAddressProxyArray"))
                this.__MacAddressProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__MacAddressProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 10, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {NDIS_802_11_SSID}
     */
    Ssid {
        get {
            if(!this.HasProp("__Ssid"))
                this.__Ssid := NDIS_802_11_SSID(12, this)
            return this.__Ssid
        }
    }

    /**
     * @type {Integer}
     */
    Privacy {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Rssi {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {NDIS_802_11_NETWORK_TYPE}
     */
    NetworkTypeInUse {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {NDIS_802_11_CONFIGURATION}
     */
    Configuration {
        get {
            if(!this.HasProp("__Configuration"))
                this.__Configuration := NDIS_802_11_CONFIGURATION(60, this)
            return this.__Configuration
        }
    }

    /**
     * @type {NDIS_802_11_NETWORK_INFRASTRUCTURE}
     */
    InfrastructureMode {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * @type {Array<Integer>}
     */
    SupportedRates {
        get {
            if(!this.HasProp("__SupportedRatesProxyArray"))
                this.__SupportedRatesProxyArray := Win32FixedArray(this.ptr + 96, 8, Primitive, "char")
            return this.__SupportedRatesProxyArray
        }
    }
}
