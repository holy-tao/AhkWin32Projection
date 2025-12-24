#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_SSID.ahk
#Include .\NDIS_802_11_CONFIGURATION_FH.ahk
#Include .\NDIS_802_11_CONFIGURATION.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_WLAN_BSSID_EX extends Win32Struct
{
    static sizeof => 120

    static packingSize => 4

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
     * @type {Integer}
     */
    NetworkTypeInUse {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {NDIS_802_11_CONFIGURATION}
     */
    Configuration{
        get {
            if(!this.HasProp("__Configuration"))
                this.__Configuration := NDIS_802_11_CONFIGURATION(60, this)
            return this.__Configuration
        }
    }

    /**
     * @type {Integer}
     */
    InfrastructureMode {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * @type {Array<Byte>}
     */
    SupportedRates{
        get {
            if(!this.HasProp("__SupportedRatesProxyArray"))
                this.__SupportedRatesProxyArray := Win32FixedArray(this.ptr + 96, 16, Primitive, "char")
            return this.__SupportedRatesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    IELength {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Array<Byte>}
     */
    IEs{
        get {
            if(!this.HasProp("__IEsProxyArray"))
                this.__IEsProxyArray := Win32FixedArray(this.ptr + 116, 1, Primitive, "char")
            return this.__IEsProxyArray
        }
    }
}
