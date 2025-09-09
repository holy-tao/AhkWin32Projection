#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_SSID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_ASSOCIATION_START_PARAMETERS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MacAddr{
        get {
            if(!this.HasProp("__MacAddrProxyArray"))
                this.__MacAddrProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__MacAddrProxyArray
        }
    }

    /**
     * @type {DOT11_SSID}
     */
    SSID{
        get {
            if(!this.HasProp("__SSID"))
                this.__SSID := DOT11_SSID(this.ptr + 16)
            return this.__SSID
        }
    }

    /**
     * @type {Integer}
     */
    uIHVDataOffset {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    uIHVDataSize {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
