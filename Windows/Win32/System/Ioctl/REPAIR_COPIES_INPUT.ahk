#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Input structure for the FSCTL_REPAIR_COPIES control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-repair_copies_input
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class REPAIR_COPIES_INPUT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Set to <c>sizeof(REPAIR_COPIES_INPUT)</c>.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved (must be zero)
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The file position to start the repair operation.
     * @type {Integer}
     */
    FileOffset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The number of bytes to be repaired.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The zero-based copy number of the source copy.
     * @type {Integer}
     */
    SourceCopy {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The number of copies that will be repaired. This is the size of the <b>RepairCopies</b> 
     *       array.
     * @type {Integer}
     */
    NumberOfRepairCopies {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The zero-based copy numbers of the copies that will be repaired.
     * @type {Array<UInt32>}
     */
    RepairCopies{
        get {
            if(!this.HasProp("__RepairCopiesProxyArray"))
                this.__RepairCopiesProxyArray := Win32FixedArray(this.ptr + 28, 4, Primitive, "uint")
            return this.__RepairCopiesProxyArray
        }
    }
}
