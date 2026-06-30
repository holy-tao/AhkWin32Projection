#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_ZONE_CONDITION.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\STORAGE_ZONE_TYPES.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_ZONE_DESCRIPTOR extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {STORAGE_ZONE_TYPES}
     */
    ZoneType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {STORAGE_ZONE_CONDITION}
     */
    ZoneCondition {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    ResetWritePointerRecommend {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved0 {
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 13, 3, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ZoneSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    WritePointerOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
