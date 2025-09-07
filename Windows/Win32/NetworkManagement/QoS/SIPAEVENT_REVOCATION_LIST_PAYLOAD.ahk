#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class SIPAEVENT_REVOCATION_LIST_PAYLOAD extends Win32Struct
{
    static sizeof => 15

    static packingSize => 1

    /**
     * @type {Integer}
     */
    CreationTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DigestLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    HashAlgID {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    Digest{
        get {
            if(!this.HasProp("__DigestProxyArray"))
                this.__DigestProxyArray := Win32FixedArray(this.ptr + 14, 1, Primitive, "char")
            return this.__DigestProxyArray
        }
    }
}
