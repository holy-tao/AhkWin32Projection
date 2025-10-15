#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SCAN_REQUEST_V2 extends Win32Struct
{
    static sizeof => 60

    static packingSize => 4

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
     * @type {Integer}
     */
    dot11ScanType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {BOOLEAN}
     */
    bRestrictedScan{
        get {
            if(!this.HasProp("__bRestrictedScan"))
                this.__bRestrictedScan := BOOLEAN(this.ptr + 16)
            return this.__bRestrictedScan
        }
    }

    /**
     * @type {Integer}
     */
    udot11SSIDsOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    uNumOfdot11SSIDs {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {BOOLEAN}
     */
    bUseRequestIE{
        get {
            if(!this.HasProp("__bUseRequestIE"))
                this.__bUseRequestIE := BOOLEAN(this.ptr + 28)
            return this.__bUseRequestIE
        }
    }

    /**
     * @type {Integer}
     */
    uRequestIDsOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    uNumOfRequestIDs {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    uPhyTypeInfosOffset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    uNumOfPhyTypeInfos {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    uIEsOffset {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    uIEsLength {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Array<Byte>}
     */
    ucBuffer{
        get {
            if(!this.HasProp("__ucBufferProxyArray"))
                this.__ucBufferProxyArray := Win32FixedArray(this.ptr + 56, 1, Primitive, "char")
            return this.__ucBufferProxyArray
        }
    }
}
