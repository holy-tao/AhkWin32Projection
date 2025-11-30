#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains the version of the virtual disk SET_VIRTUAL_DISK_INFO structure to use in calls to VHD functions.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-set_virtual_disk_info_version
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class SET_VIRTUAL_DISK_INFO_VERSION extends Win32Enum{

    /**
     * Not used. Will fail the operation.
     * @type {Integer (Int32)}
     */
    static SET_VIRTUAL_DISK_INFO_UNSPECIFIED => 0

    /**
     * Parent information is being set.
     * @type {Integer (Int32)}
     */
    static SET_VIRTUAL_DISK_INFO_PARENT_PATH => 1

    /**
     * A unique identifier is being set.
     * 
     * <div class="alert"><b>Note</b>  If the VHD's unique identifier changes as a result of the 
     *        <b>SET_VIRTUAL_DISK_INFO_IDENTIFIER</b> operation, it will break any existing differencing 
     *        chains on the VHD.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static SET_VIRTUAL_DISK_INFO_IDENTIFIER => 2

    /**
     * Sets the parent file path and the child depth.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static SET_VIRTUAL_DISK_INFO_PARENT_PATH_WITH_DEPTH => 3

    /**
     * Sets the physical sector size reported by the VHD.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static SET_VIRTUAL_DISK_INFO_PHYSICAL_SECTOR_SIZE => 4

    /**
     * The identifier that is uniquely created when a user first creates the virtual disk to attempt to uniquely identify that virtual disk. 
     * 
     * <b>Windows 8 and Windows Server 2012:  </b>This value is not supported before Windows 8.1 and Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static SET_VIRTUAL_DISK_INFO_VIRTUAL_DISK_ID => 5

    /**
     * Whether resilient change tracking (RCT) is turned on for the virtual disk.
     * 
     * <b>Windows 8.1 and Windows Server 2012 R2:  </b>This value is not supported before Windows 10 and Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static SET_VIRTUAL_DISK_INFO_CHANGE_TRACKING_STATE => 6

    /**
     * The parent linkage information that differencing VHDs store. Parent linkage information is metadata used to locate and correctly identify the next parent in the virtual disk  chain. 
     * 
     * <b>Windows 8.1 and Windows Server 2012 R2:  </b>This value is not supported before Windows 10 and Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static SET_VIRTUAL_DISK_INFO_PARENT_LOCATOR => 7
}
