#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PARTITION_INFORMATION_MBR.ahk" { PARTITION_INFORMATION_MBR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\PARTITION_INFORMATION_GPT.ahk" { PARTITION_INFORMATION_GPT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PARTITION_STYLE.ahk" { PARTITION_STYLE }
#Import ".\GPT_ATTRIBUTES.ahk" { GPT_ATTRIBUTES }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains partition information for standard AT-style master boot record (MBR) and Extensible Firmware Interface (EFI) disks.
 * @remarks
 * If the partition is on a disk formatted as type master boot record (MBR), partition size totals are limited. For more information, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_disk_set_drive_layout">IOCTL_DISK_SET_DRIVE_LAYOUT</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-partition_information_ex
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PARTITION_INFORMATION_EX {
    #StructPack 8

    /**
     * The format of the partition. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-partition_style">PARTITION_STYLE</a>.
     */
    PartitionStyle : PARTITION_STYLE

    /**
     * The starting offset of the partition.
     */
    StartingOffset : Int64

    /**
     * The size of the partition, in bytes.
     */
    PartitionLength : Int64

    /**
     * The number of the partition (1-based).
     */
    PartitionNumber : UInt32

    /**
     * If this member is <b>TRUE</b>, the partition is rewritable. The value of this parameter should be set to <b>TRUE</b>.
     */
    RewritePartition : BOOLEAN

    IsServicePartition : BOOLEAN

    Mbr : PARTITION_INFORMATION_MBR

    static __New() {
        DefineProp(this.Prototype, 'Gpt', { type: PARTITION_INFORMATION_GPT, offset: 32 })
        this.DeleteProp("__New")
    }
}
