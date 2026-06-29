#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information that the IOCTL_DISK_CREATE_DISK control code uses to initialize master boot record (MBR) disks.
 * @remarks
 * The 
 * <b>CREATE_DISK_MBR</b> structure is part of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-create_disk">CREATE_DISK</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-create_disk_mbr
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CREATE_DISK_MBR {
    #StructPack 4

    /**
     * The disk signature of the MBR disk to be initialized.
     */
    Signature : UInt32

}
