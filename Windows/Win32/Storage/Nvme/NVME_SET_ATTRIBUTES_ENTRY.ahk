#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_set_attributes_entry
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_SET_ATTRIBUTES_ENTRY extends Win32Struct
{
    static sizeof => 128

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Identifier {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ENDGID {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Random4KBReadTypical {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    OptimalWriteSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    TotalCapacity{
        get {
            if(!this.HasProp("__TotalCapacityProxyArray"))
                this.__TotalCapacityProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__TotalCapacityProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    UnallocatedCapacity{
        get {
            if(!this.HasProp("__UnallocatedCapacityProxyArray"))
                this.__UnallocatedCapacityProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "char")
            return this.__UnallocatedCapacityProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 48, 80, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }
}
