#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_SSID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SCAN_REQUEST extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dot11BSSType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    dot11BSSID{
        get {
            if(!this.HasProp("__dot11BSSIDProxyArray"))
                this.__dot11BSSIDProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__dot11BSSIDProxyArray
        }
    }

    /**
     * @type {DOT11_SSID}
     */
    dot11SSID{
        get {
            if(!this.HasProp("__dot11SSID"))
                this.__dot11SSID := DOT11_SSID(this.ptr + 16)
            return this.__dot11SSID
        }
    }

    /**
     * @type {Integer}
     */
    dot11ScanType {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    bRestrictedScan {
        get => NumGet(this, 56, "char")
        set => NumPut("char", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    bUseRequestIE {
        get => NumGet(this, 57, "char")
        set => NumPut("char", value, this, 57)
    }

    /**
     * @type {Integer}
     */
    uRequestIDsOffset {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    uNumOfRequestIDs {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    uPhyTypesOffset {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    uNumOfPhyTypes {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    uIEsOffset {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    uIEsLength {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Array<Byte>}
     */
    ucBuffer{
        get {
            if(!this.HasProp("__ucBufferProxyArray"))
                this.__ucBufferProxyArray := Win32FixedArray(this.ptr + 84, 1, Primitive, "char")
            return this.__ucBufferProxyArray
        }
    }
}
