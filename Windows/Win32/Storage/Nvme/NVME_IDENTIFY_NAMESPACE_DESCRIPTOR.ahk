#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_IDENTIFY_NAMESPACE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

    /**
     * @type {Integer}
     */
    NIDT {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NIDL {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    NID{
        get {
            if(!this.HasProp("__NIDProxyArray"))
                this.__NIDProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__NIDProxyArray
        }
    }
}
