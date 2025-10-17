#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk
#Include .\DOT11_ACCESSNETWORKOPTIONS.ahk
#Include .\DOT11_VENUEINFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_AVAILABLE_NETWORK_V2 extends Win32Struct
{
    static sizeof => 648

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
    dot11Ssid{
        get {
            if(!this.HasProp("__dot11Ssid"))
                this.__dot11Ssid := DOT11_SSID(512, this)
            return this.__dot11Ssid
        }
    }

    /**
     * @type {Integer}
     */
    dot11BssType {
        get => NumGet(this, 548, "int")
        set => NumPut("int", value, this, 548)
    }

    /**
     * @type {Integer}
     */
    uNumberOfBssids {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }

    /**
     * @type {BOOL}
     */
    bNetworkConnectable {
        get => NumGet(this, 556, "int")
        set => NumPut("int", value, this, 556)
    }

    /**
     * @type {Integer}
     */
    wlanNotConnectableReason {
        get => NumGet(this, 560, "uint")
        set => NumPut("uint", value, this, 560)
    }

    /**
     * @type {Integer}
     */
    uNumberOfPhyTypes {
        get => NumGet(this, 564, "uint")
        set => NumPut("uint", value, this, 564)
    }

    /**
     * @type {Array<Int32>}
     */
    dot11PhyTypes{
        get {
            if(!this.HasProp("__dot11PhyTypesProxyArray"))
                this.__dot11PhyTypesProxyArray := Win32FixedArray(this.ptr + 568, 8, Primitive, "int")
            return this.__dot11PhyTypesProxyArray
        }
    }

    /**
     * @type {BOOL}
     */
    bMorePhyTypes {
        get => NumGet(this, 600, "int")
        set => NumPut("int", value, this, 600)
    }

    /**
     * @type {Integer}
     */
    wlanSignalQuality {
        get => NumGet(this, 604, "uint")
        set => NumPut("uint", value, this, 604)
    }

    /**
     * @type {BOOL}
     */
    bSecurityEnabled {
        get => NumGet(this, 608, "int")
        set => NumPut("int", value, this, 608)
    }

    /**
     * @type {Integer}
     */
    dot11DefaultAuthAlgorithm {
        get => NumGet(this, 612, "int")
        set => NumPut("int", value, this, 612)
    }

    /**
     * @type {Integer}
     */
    dot11DefaultCipherAlgorithm {
        get => NumGet(this, 616, "int")
        set => NumPut("int", value, this, 616)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 620, "uint")
        set => NumPut("uint", value, this, 620)
    }

    /**
     * @type {DOT11_ACCESSNETWORKOPTIONS}
     */
    AccessNetworkOptions{
        get {
            if(!this.HasProp("__AccessNetworkOptions"))
                this.__AccessNetworkOptions := DOT11_ACCESSNETWORKOPTIONS(625, this)
            return this.__AccessNetworkOptions
        }
    }

    /**
     * @type {Array<Byte>}
     */
    dot11HESSID{
        get {
            if(!this.HasProp("__dot11HESSIDProxyArray"))
                this.__dot11HESSIDProxyArray := Win32FixedArray(this.ptr + 630, 6, Primitive, "char")
            return this.__dot11HESSIDProxyArray
        }
    }

    /**
     * @type {DOT11_VENUEINFO}
     */
    VenueInfo{
        get {
            if(!this.HasProp("__VenueInfo"))
                this.__VenueInfo := DOT11_VENUEINFO(636, this)
            return this.__VenueInfo
        }
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 640, "uint")
        set => NumPut("uint", value, this, 640)
    }
}
