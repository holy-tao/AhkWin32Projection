#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class HIBERFILE_BUCKET extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MaxPhysicalMemory {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    PhysicalMemoryPercent{
        get {
            if(!this.HasProp("__PhysicalMemoryPercentProxyArray"))
                this.__PhysicalMemoryPercentProxyArray := Win32FixedArray(this.ptr + 8, 3, Primitive, "uint")
            return this.__PhysicalMemoryPercentProxyArray
        }
    }
}
