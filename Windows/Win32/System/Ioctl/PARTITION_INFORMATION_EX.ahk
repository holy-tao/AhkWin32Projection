#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PARTITION_INFORMATION_MBR.ahk
#Include .\PARTITION_INFORMATION_GPT.ahk

/**
 * Contains partition information for standard AT-style master boot record (MBR) and Extensible Firmware Interface (EFI) disks.
 * @remarks
 * If the partition is on a disk formatted as type master boot record (MBR), partition size totals are limited. For more information, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_set_drive_layout">IOCTL_DISK_SET_DRIVE_LAYOUT</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-partition_information_ex
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class PARTITION_INFORMATION_EX extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * The format of the partition. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-partition_style">PARTITION_STYLE</a>.
     * @type {Integer}
     */
    PartitionStyle {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The starting offset of the partition.
     * @type {Integer}
     */
    StartingOffset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The size of the partition, in bytes.
     * @type {Integer}
     */
    PartitionLength {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The number of the partition (1-based).
     * @type {Integer}
     */
    PartitionNumber {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * If this member is <b>TRUE</b>, the partition is rewritable. The value of this parameter should be set to <b>TRUE</b>.
     * @type {Integer}
     */
    RewritePartition {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * 
     * @type {Integer}
     */
    IsServicePartition {
        get => NumGet(this, 29, "char")
        set => NumPut("char", value, this, 29)
    }

    /**
     * @type {PARTITION_INFORMATION_MBR}
     */
    Mbr{
        get {
            if(!this.HasProp("__Mbr"))
                this.__Mbr := PARTITION_INFORMATION_MBR(this.ptr + 32)
            return this.__Mbr
        }
    }

    /**
     * @type {PARTITION_INFORMATION_GPT}
     */
    Gpt{
        get {
            if(!this.HasProp("__Gpt"))
                this.__Gpt := PARTITION_INFORMATION_GPT(this.ptr + 32)
            return this.__Gpt
        }
    }
}
