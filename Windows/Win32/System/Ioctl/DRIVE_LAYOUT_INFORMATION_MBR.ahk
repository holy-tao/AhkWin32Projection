#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides information about a drive's master boot record (MBR) partitions.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-drive_layout_information_mbr
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DRIVE_LAYOUT_INFORMATION_MBR {
    #StructPack 4

    /**
     * The signature of the drive.
     */
    Signature : UInt32

    CheckSum : UInt32

}
