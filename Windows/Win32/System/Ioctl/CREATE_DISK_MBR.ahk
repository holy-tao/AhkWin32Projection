#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that the IOCTL_DISK_CREATE_DISK control code uses to initialize master boot record (MBR) disks.
 * @remarks
 * 
 * The 
 * <b>CREATE_DISK_MBR</b> structure is part of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-create_disk">CREATE_DISK</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-create_disk_mbr
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CREATE_DISK_MBR extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The disk signature of the MBR disk to be initialized.
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
