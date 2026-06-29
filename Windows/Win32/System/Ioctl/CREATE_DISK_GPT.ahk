#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

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
class CREATE_DISK_GPT extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * The disk identifier (GUID) of the GPT disk to be initialized.
     * @type {Guid}
     */
    DiskId {
        get {
            if(!this.HasProp("__DiskId"))
                this.__DiskId := Guid(0, this)
            return this.__DiskId
        }
    }

    /**
     * The maximum number of partitions allowed on the GPT disk to be initialized without repartitioning the disk.
     * @type {Integer}
     */
    MaxPartitionCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
