#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies parameters for the repair operation.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_data_set_repair_parameters
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_DATA_SET_REPAIR_PARAMETERS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The number of copies that will be repaired.
     * @type {Integer}
     */
    NumberOfRepairCopies {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The copy number of the source copy.
     * @type {Integer}
     */
    SourceCopy {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The copy numbers of all the copies that will be repaired.
     * @type {Array<UInt32>}
     */
    RepairCopies{
        get {
            if(!this.HasProp("__RepairCopiesProxyArray"))
                this.__RepairCopiesProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "uint")
            return this.__RepairCopiesProxyArray
        }
    }
}
