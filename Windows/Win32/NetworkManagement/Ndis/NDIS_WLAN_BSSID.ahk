#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_SSID.ahk
#Include .\NDIS_802_11_CONFIGURATION_FH.ahk
#Include .\NDIS_802_11_CONFIGURATION.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_WLAN_BSSID extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    MacAddress{
        get {
            if(!this.HasProp("__MacAddressProxyArray"))
                this.__MacAddressProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__MacAddressProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 10, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {NDIS_802_11_SSID}
     */
    Ssid{
        get {
            if(!this.HasProp("__Ssid"))
                this.__Ssid := NDIS_802_11_SSID(this.ptr + 16)
            return this.__Ssid
        }
    }

    /**
     * @type {Integer}
     */
    Privacy {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    Rssi {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    NetworkTypeInUse {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * @type {NDIS_802_11_CONFIGURATION}
     */
    Configuration{
        get {
            if(!this.HasProp("__Configuration"))
                this.__Configuration := NDIS_802_11_CONFIGURATION(this.ptr + 64)
            return this.__Configuration
        }
    }

    /**
     * @type {Integer}
     */
    InfrastructureMode {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * @type {Array<Byte>}
     */
    SupportedRates{
        get {
            if(!this.HasProp("__SupportedRatesProxyArray"))
                this.__SupportedRatesProxyArray := Win32FixedArray(this.ptr + 100, 8, Primitive, "char")
            return this.__SupportedRatesProxyArray
        }
    }
}
