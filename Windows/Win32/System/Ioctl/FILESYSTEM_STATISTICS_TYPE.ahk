#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The file system is an exFAT file system.
  * 
  * If this value is set, this structure is followed by an 
  *          <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-exfat_statistics">EXFAT_STATISTICS</a> structure.
  * 
  * <b>Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Vista with SP1.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-filesystem_statistics
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILESYSTEM_STATISTICS_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static FILESYSTEM_STATISTICS_TYPE_EXFAT => 3

    /**
     * @type {Integer (UInt16)}
     */
    static FILESYSTEM_STATISTICS_TYPE_FAT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static FILESYSTEM_STATISTICS_TYPE_NTFS => 1
}
