#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_CIPHER_DEFAULT_KEY_VALUE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

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
     * @type {Integer}
     */
    uKeyIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    AlgorithmId {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    MacAddr{
        get {
            if(!this.HasProp("__MacAddrProxyArray"))
                this.__MacAddrProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__MacAddrProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    bDelete {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    bStatic {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * @type {Integer}
     */
    usKeyLength {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Array<Byte>}
     */
    ucKey{
        get {
            if(!this.HasProp("__ucKeyProxyArray"))
                this.__ucKeyProxyArray := Win32FixedArray(this.ptr + 22, 1, Primitive, "char")
            return this.__ucKeyProxyArray
        }
    }
}
