#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_REGISTERED_CONTROLLER_DATA extends Win32Struct
{
    static sizeof => 24

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
     * @type {Array<Byte>}
     */
    HOSTID{
        get {
            if(!this.HasProp("__HOSTIDProxyArray"))
                this.__HOSTIDProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__HOSTIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    RKEY {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
