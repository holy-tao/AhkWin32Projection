#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_ZONE_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_REPORT_ZONE_INFO extends Win32Struct {
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ZoneCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 8, 7, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {NVME_ZONE_DESCRIPTOR}
     */
    ZoneDescriptor {
        get {
            if(!this.HasProp("__ZoneDescriptorProxyArray"))
                this.__ZoneDescriptorProxyArray := Win32FixedArray(this.ptr + 64, 1, NVME_ZONE_DESCRIPTOR, "")
            return this.__ZoneDescriptorProxyArray
        }
    }
}
