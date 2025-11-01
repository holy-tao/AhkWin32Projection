#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/Power/battery-information-str
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class BATTERY_INFORMATION extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Capabilities {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Technology {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 5, 3, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Chemistry{
        get {
            if(!this.HasProp("__ChemistryProxyArray"))
                this.__ChemistryProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "char")
            return this.__ChemistryProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    DesignedCapacity {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    FullChargedCapacity {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    DefaultAlert1 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DefaultAlert2 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    CriticalBias {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    CycleCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
