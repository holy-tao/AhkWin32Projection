#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information about a drive's GUID partition table (GPT) partitions.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-drive_layout_information_gpt
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DRIVE_LAYOUT_INFORMATION_GPT {
    #StructPack 8

    /**
     * The <b>GUID</b> of the disk.
     */
    DiskId : Guid

    /**
     * The starting byte offset of the first usable block.
     */
    StartingUsableOffset : Int64

    /**
     * The size of the usable blocks on the disk, in bytes.
     */
    UsableLength : Int64

    /**
     * The maximum number of partitions that can be defined in the usable block.
     */
    MaxPartitionCount : UInt32

}
