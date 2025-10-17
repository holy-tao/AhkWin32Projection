#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_DISASSOCIATION_PARAMETERS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(0, this)
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
     * @type {Integer}
     */
    uReason {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    uIHVDataOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    uIHVDataSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
