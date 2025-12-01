#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a drive's GUID partition table (GPT) partitions.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-drive_layout_information_gpt
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DRIVE_LAYOUT_INFORMATION_GPT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The <b>GUID</b> of the disk.
     * @type {Pointer<Guid>}
     */
    DiskId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The starting byte offset of the first usable block.
     * @type {Integer}
     */
    StartingUsableOffset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The size of the usable blocks on the disk, in bytes.
     * @type {Integer}
     */
    UsableLength {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The maximum number of partitions that can be defined in the usable block.
     * @type {Integer}
     */
    MaxPartitionCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
