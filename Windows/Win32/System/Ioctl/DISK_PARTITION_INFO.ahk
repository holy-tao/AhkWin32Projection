#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the disk partition information.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-disk_partition_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DISK_PARTITION_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    SizeOfPartitionInfo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The format of a partition.
     * 
     * For more information, see [PARTITION_STYLE](ne-winioctl-partition_style.md).
     * @type {Integer}
     */
    PartitionStyle {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    CheckSum {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer<Guid>}
     */
    DiskId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
