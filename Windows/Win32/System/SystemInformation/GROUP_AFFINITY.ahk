#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a processor group-specific affinity, such as the affinity of a thread.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-group_affinity
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class GROUP_AFFINITY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A bitmap that specifies the affinity for zero or more processors within the specified group.
     * @type {Pointer}
     */
    Mask {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The processor group number.
     * @type {Integer}
     */
    Group {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * This member is reserved.
     * @type {Array<UInt16>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 10, 3, Primitive, "ushort")
            return this.__ReservedProxyArray
        }
    }
}
