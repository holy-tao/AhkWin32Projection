#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains virtual disk attach request flags.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-attach_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class ATTACH_VIRTUAL_DISK_FLAG{

    /**
     * No flags. Use system defaults.
     * 
     * This enumeration value is not supported for ISO virtual disks. 
     *        <b>ATTACH_VIRTUAL_DISK_FLAG_READ_ONLY</b> must be specified.
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_FLAG_NONE => 0

    /**
     * Attach the virtual disk as read-only.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This flag is not supported for opening ISO virtual disks until Windows 8 and 
     *         Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_FLAG_READ_ONLY => 1

    /**
     * No drive letters are assigned to the disk's volumes.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This flag is not supported for opening ISO virtual disks until Windows 8 and 
     *         Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_FLAG_NO_DRIVE_LETTER => 2

    /**
     * Will decouple the virtual disk lifetime from that of the <i>VirtualDiskHandle</i>. The 
     *        virtual disk will be attached until the 
     *        <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-detachvirtualdisk">DetachVirtualDisk</a> function is called, even if all 
     *        open handles to the virtual disk are closed.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This flag is not supported for opening ISO virtual disks until Windows 8 and 
     *         Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME => 4

    /**
     * Reserved.
     * 
     * This flag is not supported for ISO virtual disks.
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_FLAG_NO_LOCAL_HOST => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_FLAG_NO_SECURITY_DESCRIPTOR => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_FLAG_BYPASS_DEFAULT_ENCRYPTION_POLICY => 32

    /**
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_FLAG_NON_PNP => 64

    /**
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_FLAG_RESTRICTED_RANGE => 128

    /**
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_FLAG_SINGLE_PARTITION => 256

    /**
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_FLAG_REGISTER_VOLUME => 512

    /**
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_FLAG_AT_BOOT => 1024
}
