#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_REGISTERED_CONTROLLER_EXTENDED_DATA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    CNTLID {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    RCSTS {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 3, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    RKEY {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    HOSTID{
        get {
            if(!this.HasProp("__HOSTIDProxyArray"))
                this.__HOSTIDProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__HOSTIDProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
