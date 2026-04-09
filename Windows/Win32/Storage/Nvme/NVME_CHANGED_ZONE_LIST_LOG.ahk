#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_CHANGED_ZONE_LIST_LOG extends Win32Struct {
    static sizeof => 4096

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ZoneIdentifiersCount {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 2, 6, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    ZoneIdentifier {
        get {
            if(!this.HasProp("__ZoneIdentifierProxyArray"))
                this.__ZoneIdentifierProxyArray := Win32FixedArray(this.ptr + 8, 511, Primitive, "uint")
            return this.__ZoneIdentifierProxyArray
        }
    }
}
