#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DRIVE_LAYOUT_INFORMATION_MBR.ahk
#Include .\DRIVE_LAYOUT_INFORMATION_GPT.ahk
#Include .\PARTITION_INFORMATION_MBR.ahk
#Include .\PARTITION_INFORMATION_GPT.ahk
#Include .\PARTITION_INFORMATION_EX.ahk

/**
 * Contains extended information about a drive's partitions.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-drive_layout_information_ex
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DRIVE_LAYOUT_INFORMATION_EX extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The style of the partitions on the drive enumerated by the [**PARTITION_STYLE**](ne-winioctl-partition_style.md) enumeration.
     * 
     * | Style | Value | Meaning |
     * | --- | --- | --- |
     * | **PARTITION_STYLE_MBR** | 0 | Master boot record (MBR) format.|
     * | **PARTITION_STYLE_GPT** | 1 | GUID Partition Table (GPT) format. |
     * | **PARTITION_STYLE_RAW** | 2 | Partition not formatted in either of the recognized formats—MBR or GPT. |
     * @type {Integer}
     */
    PartitionStyle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of partitions on the drive. On hard disks with the MBR layout, this value will always be a multiple of 4. Any partitions that are actually unused will have a partition type of **PARTITION_ENTRY_UNUSED** (0) set in the **PartitionType** member of the [**PARTITION_INFORMATION_MBR**](ns-winioctl-partition_information_mbr.md) structure of the **Mbr** member of the [**PARTITION_INFORMATION_EX**](ns-winioctl-partition_information_ex.md) structure of the **PartitionEntry** member of this structure.
     * @type {Integer}
     */
    PartitionCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {DRIVE_LAYOUT_INFORMATION_MBR}
     */
    Mbr{
        get {
            if(!this.HasProp("__Mbr"))
                this.__Mbr := DRIVE_LAYOUT_INFORMATION_MBR(this.ptr + 8)
            return this.__Mbr
        }
    }

    /**
     * @type {DRIVE_LAYOUT_INFORMATION_GPT}
     */
    Gpt{
        get {
            if(!this.HasProp("__Gpt"))
                this.__Gpt := DRIVE_LAYOUT_INFORMATION_GPT(this.ptr + 8)
            return this.__Gpt
        }
    }

    /**
     * A variable-sized array of [**PARTITION_INFORMATION_EX**](ns-winioctl-partition_information_ex.md) structures, one structure for each partition on the drive.
     * @type {Array<PARTITION_INFORMATION_EX>}
     */
    PartitionEntry{
        get {
            if(!this.HasProp("__PartitionEntryProxyArray"))
                this.__PartitionEntryProxyArray := Win32FixedArray(this.ptr + 16, 8, PARTITION_INFORMATION_EX, "")
            return this.__PartitionEntryProxyArray
        }
    }
}
