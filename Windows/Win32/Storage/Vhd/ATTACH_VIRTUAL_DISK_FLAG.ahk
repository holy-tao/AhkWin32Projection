#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains virtual disk attach request flags.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-attach_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
class ATTACH_VIRTUAL_DISK_FLAG extends Win32BitflagEnum {

    /**
     * No flags. Use system defaults.
     * 
     * This enumeration value is not supported for ISO virtual disks. 
     *        <b>ATTACH_VIRTUAL_DISK_FLAG_READ_ONLY</b> must be specified.
     * Native name: ATTACH_VIRTUAL_DISK_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Attach the virtual disk as read-only.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This flag is not supported for opening ISO virtual disks until Windows 8 and 
     *         Windows Server 2012.
     * Native name: ATTACH_VIRTUAL_DISK_FLAG_READ_ONLY
     * @type {Integer (Int32)}
     */
    static READ_ONLY => 1

    /**
     * No drive letters are assigned to the disk's volumes.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This flag is not supported for opening ISO virtual disks until Windows 8 and 
     *         Windows Server 2012.
     * Native name: ATTACH_VIRTUAL_DISK_FLAG_NO_DRIVE_LETTER
     * @type {Integer (Int32)}
     */
    static NO_DRIVE_LETTER => 2

    /**
     * Will decouple the virtual disk lifetime from that of the <i>VirtualDiskHandle</i>. The 
     *        virtual disk will be attached until the 
     *        <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-detachvirtualdisk">DetachVirtualDisk</a> function is called, even if all 
     *        open handles to the virtual disk are closed.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>This flag is not supported for opening ISO virtual disks until Windows 8 and 
     *         Windows Server 2012.
     * Native name: ATTACH_VIRTUAL_DISK_FLAG_PERMANENT_LIFETIME
     * @type {Integer (Int32)}
     */
    static PERMANENT_LIFETIME => 4

    /**
     * Reserved.
     * 
     * This flag is not supported for ISO virtual disks.
     * Native name: ATTACH_VIRTUAL_DISK_FLAG_NO_LOCAL_HOST
     * @type {Integer (Int32)}
     */
    static NO_LOCAL_HOST => 8

    /**
     * Native name: ATTACH_VIRTUAL_DISK_FLAG_NO_SECURITY_DESCRIPTOR
     * @type {Integer (Int32)}
     */
    static NO_SECURITY_DESCRIPTOR => 16

    /**
     * Native name: ATTACH_VIRTUAL_DISK_FLAG_BYPASS_DEFAULT_ENCRYPTION_POLICY
     * @type {Integer (Int32)}
     */
    static BYPASS_DEFAULT_ENCRYPTION_POLICY => 32

    /**
     * Native name: ATTACH_VIRTUAL_DISK_FLAG_NON_PNP
     * @type {Integer (Int32)}
     */
    static NON_PNP => 64

    /**
     * Native name: ATTACH_VIRTUAL_DISK_FLAG_RESTRICTED_RANGE
     * @type {Integer (Int32)}
     */
    static RESTRICTED_RANGE => 128

    /**
     * Native name: ATTACH_VIRTUAL_DISK_FLAG_SINGLE_PARTITION
     * @type {Integer (Int32)}
     */
    static SINGLE_PARTITION => 256

    /**
     * Native name: ATTACH_VIRTUAL_DISK_FLAG_REGISTER_VOLUME
     * @type {Integer (Int32)}
     */
    static REGISTER_VOLUME => 512

    /**
     * Native name: ATTACH_VIRTUAL_DISK_FLAG_AT_BOOT
     * @type {Integer (Int32)}
     */
    static AT_BOOT => 1024
}
