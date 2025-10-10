#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_SET_ATTRIBUTES_ENTRY.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVM_SET_LIST extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {Integer}
     */
    IdentifierCount {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 1, 127, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<NVME_SET_ATTRIBUTES_ENTRY>}
     */
    Entry{
        get {
            if(!this.HasProp("__EntryProxyArray"))
                this.__EntryProxyArray := Win32FixedArray(this.ptr + 128, 1, NVME_SET_ATTRIBUTES_ENTRY, "")
            return this.__EntryProxyArray
        }
    }
}
