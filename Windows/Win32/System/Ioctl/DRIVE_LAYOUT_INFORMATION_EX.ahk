#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PARTITION_INFORMATION_MBR.ahk" { PARTITION_INFORMATION_MBR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\PARTITION_INFORMATION_EX.ahk" { PARTITION_INFORMATION_EX }
#Import ".\DRIVE_LAYOUT_INFORMATION_MBR.ahk" { DRIVE_LAYOUT_INFORMATION_MBR }
#Import ".\PARTITION_INFORMATION_GPT.ahk" { PARTITION_INFORMATION_GPT }
#Import ".\DRIVE_LAYOUT_INFORMATION_GPT.ahk" { DRIVE_LAYOUT_INFORMATION_GPT }
#Import ".\PARTITION_STYLE.ahk" { PARTITION_STYLE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\GPT_ATTRIBUTES.ahk" { GPT_ATTRIBUTES }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains extended information about a drive's partitions.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-drive_layout_information_ex
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DRIVE_LAYOUT_INFORMATION_EX {
    #StructPack 8

    /**
     * The style of the partitions on the drive enumerated by the [**PARTITION_STYLE**](ne-winioctl-partition_style.md) enumeration.
     * 
     * | Style | Value | Meaning |
     * | --- | --- | --- |
     * | **PARTITION_STYLE_MBR** | 0 | Master boot record (MBR) format.|
     * | **PARTITION_STYLE_GPT** | 1 | GUID Partition Table (GPT) format. |
     * | **PARTITION_STYLE_RAW** | 2 | Partition not formatted in either of the recognized formats—MBR or GPT. |
     */
    PartitionStyle : UInt32

    /**
     * The number of partitions on the drive. On hard disks with the MBR layout, this value will always be a multiple of 4. Any partitions that are actually unused will have a partition type of **PARTITION_ENTRY_UNUSED** (0) set in the **PartitionType** member of the [**PARTITION_INFORMATION_MBR**](ns-winioctl-partition_information_mbr.md) structure of the **Mbr** member of the [**PARTITION_INFORMATION_EX**](ns-winioctl-partition_information_ex.md) structure of the **PartitionEntry** member of this structure.
     */
    PartitionCount : UInt32

    Mbr : DRIVE_LAYOUT_INFORMATION_MBR

    /**
     * A variable-sized array of [**PARTITION_INFORMATION_EX**](ns-winioctl-partition_information_ex.md) structures, one structure for each partition on the drive.
     */
    PartitionEntry : PARTITION_INFORMATION_EX[1]

    static __New() {
        DefineProp(this.Prototype, 'Gpt', { type: DRIVE_LAYOUT_INFORMATION_GPT, offset: 8 })
        this.DeleteProp("__New")
    }
}
