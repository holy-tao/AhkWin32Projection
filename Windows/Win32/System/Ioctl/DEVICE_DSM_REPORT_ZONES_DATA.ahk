#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_ZONES_ATTRIBUTES.ahk
#Include .\STORAGE_ZONE_DESCRIPTOR.ahk
#Include .\STORAGE_ZONE_TYPES.ahk
#Include .\STORAGE_ZONE_CONDITION.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class DEVICE_DSM_REPORT_ZONES_DATA extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ZoneCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {STORAGE_ZONES_ATTRIBUTES}
     */
    Attributes {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {STORAGE_ZONE_DESCRIPTOR}
     */
    ZoneDescriptors {
        get {
            if(!this.HasProp("__ZoneDescriptorsProxyArray"))
                this.__ZoneDescriptorsProxyArray := Win32FixedArray(this.ptr + 16, 1, STORAGE_ZONE_DESCRIPTOR, "")
            return this.__ZoneDescriptorsProxyArray
        }
    }
}
