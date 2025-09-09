#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_RC4_KEY_STATE extends Win32Struct
{
    static sizeof => 274

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Key{
        get {
            if(!this.HasProp("__KeyProxyArray"))
                this.__KeyProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__KeyProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    SBox{
        get {
            if(!this.HasProp("__SBoxProxyArray"))
                this.__SBoxProxyArray := Win32FixedArray(this.ptr + 16, 256, Primitive, "char")
            return this.__SBoxProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    i {
        get => NumGet(this, 272, "char")
        set => NumPut("char", value, this, 272)
    }

    /**
     * @type {Integer}
     */
    j {
        get => NumGet(this, 273, "char")
        set => NumPut("char", value, this, 273)
    }
}
