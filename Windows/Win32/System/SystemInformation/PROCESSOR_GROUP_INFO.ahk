#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the number and affinity of processors in a processor group.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-processor_group_info
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class PROCESSOR_GROUP_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The maximum number of processors in the group.
     * @type {Integer}
     */
    MaximumProcessorCount {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The number of active processors in the group.
     * @type {Integer}
     */
    ActiveProcessorCount {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * This member is reserved.
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 2, 38, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * A bitmap that specifies the affinity for zero or more active processors within the group.
     * @type {Pointer}
     */
    ActiveProcessorMask {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
