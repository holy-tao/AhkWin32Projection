#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains the version of the virtual hard disk (VHD) MERGE_VIRTUAL_DISK_PARAMETERS structure to use in calls to VHD functions.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-merge_virtual_disk_version
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class MERGE_VIRTUAL_DISK_VERSION{

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static MERGE_VIRTUAL_DISK_VERSION_UNSPECIFIED => 0

    /**
     * The <b>Version1</b> member structure will be used.
     * @type {Integer (Int32)}
     */
    static MERGE_VIRTUAL_DISK_VERSION_1 => 1

    /**
     * The <b>Version2</b> member structure will be used.
 * 
 * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported until Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static MERGE_VIRTUAL_DISK_VERSION_2 => 2
}
