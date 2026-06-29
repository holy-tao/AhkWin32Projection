#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information used by the IOCTL_DISK_CREATE_DISK control code to initialize GUID partition table (GPT) disks.
 * @remarks
 * The 
 * <b>CREATE_DISK_GPT</b> structure is defined as part of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-create_disk">CREATE_DISK</a> structure.
 * 
 * If a maximum partition count of less than 128 is specified, it will be reset to 128. This is in compliance with the EFI specification.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-create_disk_gpt
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CREATE_DISK_GPT {
    #StructPack 4

    /**
     * The disk identifier (GUID) of the GPT disk to be initialized.
     */
    DiskId : Guid

    /**
     * The maximum number of partitions allowed on the GPT disk to be initialized without repartitioning the disk.
     */
    MaxPartitionCount : UInt32

}
