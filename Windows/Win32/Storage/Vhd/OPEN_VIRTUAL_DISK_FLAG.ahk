#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains virtual hard disk (VHD) or CD or DVD image file (ISO) open request flags.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-open_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class OPEN_VIRTUAL_DISK_FLAG{

    /**
     * No flag specified.
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_NONE => 0

    /**
     * Open the VHD file (backing store) without opening any differencing-chain parents. Used to correct broken 
 *        parent links.
 * 
 * This flag is not supported for ISO virtual disks.
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_NO_PARENTS => 1

    /**
     * Reserved.
 * 
 * This flag is not supported for ISO virtual disks.
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_BLANK_FILE => 2

    /**
     * Reserved.
 * 
 * This flag is not supported for ISO virtual disks.
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_BOOT_DRIVE => 4

    /**
     * Indicates that the virtual disk should be opened in cached mode. By default the virtual disks are opened 
 *        using <b>FILE_FLAG_NO_BUFFERING</b> and 
 *        <b>FILE_FLAG_WRITE_THROUGH</b>.
 * 
 * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_CACHED_IO => 8

    /**
     * Indicates the VHD file is to be opened without opening any differencing-chain parents and the parent chain is 
 *        to be created manually using the 
 *        <a href="https://docs.microsoft.com/windows/desktop/api/virtdisk/nf-virtdisk-addvirtualdiskparent">AddVirtualDiskParent</a> function.
 * 
 * <b>Windows 7 and Windows Server 2008 R2:  </b>This value is not supported before Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_CUSTOM_DIFF_CHAIN => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_PARENT_CACHED_IO => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_VHDSET_FILE_ONLY => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_IGNORE_RELATIVE_PARENT_LOCATOR => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_NO_WRITE_HARDENING => 256

    /**
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES => 512

    /**
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_SUPPORT_SPARSE_FILES_ANY_FS => 1024

    /**
     * @type {Integer (Int32)}
     */
    static OPEN_VIRTUAL_DISK_FLAG_SUPPORT_ENCRYPTED_FILES => 2048
}
