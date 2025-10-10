#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains the kinds of virtual hard disk (VHD) information that you can retrieve.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-get_virtual_disk_info_version
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class GET_VIRTUAL_DISK_INFO_VERSION{

    /**
     * Reserved. This value should not be used.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_UNSPECIFIED => 0

    /**
     * Information related to the virtual disk size, including total size, physical allocation used, block size, 
 *       and sector size.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_SIZE => 1

    /**
     * The unique identifier.  This identifier is persistently stored  in the virtual disk and will not change even 
 *       if the virtual disk file is copied to another file.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_IDENTIFIER => 2

    /**
     * The paths to parent virtual disks. Valid only for differencing virtual disks.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_PARENT_LOCATION => 3

    /**
     * The unique identifier of the parent virtual disk. Valid only for differencing virtual disks.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_PARENT_IDENTIFIER => 4

    /**
     * The time stamp of the parent when the child virtual disk was created. Valid only for differencing virtual 
 *       disks.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_PARENT_TIMESTAMP => 5

    /**
     * The device identifier and vendor identifier that identify the type of virtual disk.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_VIRTUAL_STORAGE_TYPE => 6

    /**
     * The type of virtual disk.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_PROVIDER_SUBTYPE => 7

    /**
     * Indicates whether the virtual disk is 4 KB aligned.
 * 
 * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_IS_4K_ALIGNED => 8

    /**
     * Details about the physical disk on which the virtual disk resides.
 * 
 * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_PHYSICAL_DISK => 9

    /**
     * The physical sector size of the virtual disk.
 * 
 * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_VHD_PHYSICAL_SECTOR_SIZE => 10

    /**
     * The smallest safe minimum size of the virtual disk.
 * 
 * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_SMALLEST_SAFE_VIRTUAL_SIZE => 11

    /**
     * The fragmentation level of the virtual disk.
 * 
 * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_FRAGMENTATION => 12

    /**
     * Whether the virtual disk is currently mounted and in use. 
 * 
 * <b>Windows 8 and Windows Server 2012:  </b>This value is not supported before Windows 8.1 and Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_IS_LOADED => 13

    /**
     * The identifier that is uniquely created when a user first creates the virtual disk to attempt to uniquely identify that virtual disk. 
 * 
 * <b>Windows 8 and Windows Server 2012:  </b>This value is not supported before Windows 8.1 and Windows Server 2012 R2.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_VIRTUAL_DISK_ID => 14

    /**
     * The state of resilient change tracking (RCT) for the virtual disk.
 * 
 * <b>Windows 8.1 and Windows Server 2012 R2:  </b>This value is not supported before Windows 10 and Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static GET_VIRTUAL_DISK_INFO_CHANGE_TRACKING_STATE => 15
}
