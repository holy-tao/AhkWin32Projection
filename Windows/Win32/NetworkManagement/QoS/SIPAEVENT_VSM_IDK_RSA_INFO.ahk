#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class SIPAEVENT_VSM_IDK_RSA_INFO extends Win32Struct
{
    static sizeof => 13

    static packingSize => 1

    /**
     * @type {Integer}
     */
    KeyBitLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PublicExpLengthBytes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ModulusSizeBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    PublicKeyData{
        get {
            if(!this.HasProp("__PublicKeyDataProxyArray"))
                this.__PublicKeyDataProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__PublicKeyDataProxyArray
        }
    }
}
