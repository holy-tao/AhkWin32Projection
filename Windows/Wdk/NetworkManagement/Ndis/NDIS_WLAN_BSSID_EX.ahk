#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_NETWORK_TYPE.ahk
#Include .\NDIS_802_11_NETWORK_INFRASTRUCTURE.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_WLAN_BSSID_EX extends Win32Struct {
    static sizeof => 80

    static packingSize => 8

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
     * @type {Pointer}
     */
    Ssid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Privacy {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Rssi {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {NDIS_802_11_NETWORK_TYPE}
     */
    NetworkTypeInUse {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    Configuration {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {NDIS_802_11_NETWORK_INFRASTRUCTURE}
     */
    InfrastructureMode {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {Array<Integer>}
     */
    SupportedRates {
        get {
            if(!this.HasProp("__SupportedRatesProxyArray"))
                this.__SupportedRatesProxyArray := Win32FixedArray(this.ptr + 52, 16, Primitive, "char")
            return this.__SupportedRatesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    IELength {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Array<Integer>}
     */
    IEs {
        get {
            if(!this.HasProp("__IEsProxyArray"))
                this.__IEsProxyArray := Win32FixedArray(this.ptr + 72, 1, Primitive, "char")
            return this.__IEsProxyArray
        }
    }
}
