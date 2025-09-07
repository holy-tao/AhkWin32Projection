#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains virtual hard disk (VHD) dependency information flags.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-dependent_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class DEPENDENT_DISK_FLAG{

    /**
     * No flags specified. Use system defaults.
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_NONE => 0

    /**
     * Multiple files backing the virtual disk.
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_MULT_BACKING_FILES => 1

    /**
     * Fully allocated virtual disk.
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_FULLY_ALLOCATED => 2

    /**
     * Read-only virtual disk.
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_READ_ONLY => 4

    /**
     * The backing file of the virtual disk is not on a local physical disk.
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_REMOTE => 8

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_SYSTEM_VOLUME => 16

    /**
     * The backing file of the virtual disk is on the system volume.
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_SYSTEM_VOLUME_PARENT => 32

    /**
     * The backing file of the virtual disk is on a removable physical disk.
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_REMOVABLE => 64

    /**
     * Drive letters are not automatically assigned to the volumes on the virtual disk.
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_NO_DRIVE_LETTER => 128

    /**
     * The virtual disk is a parent of a differencing chain.
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_PARENT => 256

    /**
     * The virtual disk is not attached to the local host.
 *     For example, it is attached to a guest virtual machine.
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_NO_HOST_DISK => 512

    /**
     * The lifetime of the virtual disk is not tied to any application or process.
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_PERMANENT_LIFETIME => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_ALWAYS_ALLOW_SPARSE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DEPENDENT_DISK_FLAG_SUPPORT_ENCRYPTED_FILES => 8192
}
