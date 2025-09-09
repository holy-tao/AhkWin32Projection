#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VOLUME_PHYSICAL_OFFSET.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class VOLUME_PHYSICAL_OFFSETS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfPhysicalOffsets {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<VOLUME_PHYSICAL_OFFSET>}
     */
    PhysicalOffset{
        get {
            if(!this.HasProp("__PhysicalOffsetProxyArray"))
                this.__PhysicalOffsetProxyArray := Win32FixedArray(this.ptr + 8, 1, VOLUME_PHYSICAL_OFFSET, "")
            return this.__PhysicalOffsetProxyArray
        }
    }
}
