#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_ZONE_DESCRIPTOR.ahk
#Include .\NVME_ZONE_DESCRIPTOR_EXTENSION.ahk
#Include .\NVME_ZONE_EXTENDED_REPORT_ZONE_DESC.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_EXTENDED_REPORT_ZONE_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ZoneCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt64>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<NVME_ZONE_EXTENDED_REPORT_ZONE_DESC>}
     */
    Desc{
        get {
            if(!this.HasProp("__DescProxyArray"))
                this.__DescProxyArray := Win32FixedArray(this.ptr + 64, 8, NVME_ZONE_EXTENDED_REPORT_ZONE_DESC, "")
            return this.__DescProxyArray
        }
    }
}
