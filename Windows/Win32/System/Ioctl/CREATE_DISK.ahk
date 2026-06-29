#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CREATE_DISK_GPT.ahk" { CREATE_DISK_GPT }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PARTITION_STYLE.ahk" { PARTITION_STYLE }
#Import ".\CREATE_DISK_MBR.ahk" { CREATE_DISK_MBR }

/**
 * Contains information that the IOCTL_DISK_CREATE_DISK control code uses to initialize GUID partition table (GPT), master boot record (MBR), or raw disks.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-create_disk
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CREATE_DISK {
    #StructPack 4

    /**
     * The format of a partition. 
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-partition_style">PARTITION_STYLE</a>.
     */
    PartitionStyle : PARTITION_STYLE

    Mbr : CREATE_DISK_MBR

    static __New() {
        DefineProp(this.Prototype, 'Gpt', { type: CREATE_DISK_GPT, offset: 4 })
        this.DeleteProp("__New")
    }
}
