#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SCRUB_PARITY_EXTENT.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class SCRUB_PARITY_EXTENT_DATA extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    NumberOfParityExtents {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MaximumNumberOfParityExtents {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {SCRUB_PARITY_EXTENT}
     */
    ParityExtents {
        get {
            if(!this.HasProp("__ParityExtentsProxyArray"))
                this.__ParityExtentsProxyArray := Win32FixedArray(this.ptr + 8, 1, SCRUB_PARITY_EXTENT, "")
            return this.__ParityExtentsProxyArray
        }
    }
}
