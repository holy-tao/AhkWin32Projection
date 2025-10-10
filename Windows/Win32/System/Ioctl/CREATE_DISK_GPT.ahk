#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information used by the IOCTL_DISK_CREATE_DISK control code to initialize GUID partition table (GPT) disks.
 * @remarks
 * 
  * The 
  * <b>CREATE_DISK_GPT</b> structure is defined as part of the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-create_disk">CREATE_DISK</a> structure.
  * 
  * If a maximum partition count of less than 128 is specified, it will be reset to 128. This is in compliance with the EFI specification.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-create_disk_gpt
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CREATE_DISK_GPT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The disk identifier (GUID) of the GPT disk to be initialized.
     * @type {Pointer<Guid>}
     */
    DiskId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The maximum number of partitions allowed on the GPT disk to be initialized without repartitioning the disk.
     * @type {Integer}
     */
    MaxPartitionCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
