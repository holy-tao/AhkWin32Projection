#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains virtual hard disk (VHD) dependency information flags.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-dependent_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
class DEPENDENT_DISK_FLAG extends Win32BitflagEnum {

    /**
     * No flags specified. Use system defaults.
     * Native name: DEPENDENT_DISK_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Multiple files backing the virtual disk.
     * Native name: DEPENDENT_DISK_FLAG_MULT_BACKING_FILES
     * @type {Integer (Int32)}
     */
    static MULT_BACKING_FILES => 1

    /**
     * Fully allocated virtual disk.
     * Native name: DEPENDENT_DISK_FLAG_FULLY_ALLOCATED
     * @type {Integer (Int32)}
     */
    static FULLY_ALLOCATED => 2

    /**
     * Read-only virtual disk.
     * Native name: DEPENDENT_DISK_FLAG_READ_ONLY
     * @type {Integer (Int32)}
     */
    static READ_ONLY => 4

    /**
     * The backing file of the virtual disk is not on a local physical disk.
     * Native name: DEPENDENT_DISK_FLAG_REMOTE
     * @type {Integer (Int32)}
     */
    static REMOTE => 8

    /**
     * Reserved.
     * Native name: DEPENDENT_DISK_FLAG_SYSTEM_VOLUME
     * @type {Integer (Int32)}
     */
    static SYSTEM_VOLUME => 16

    /**
     * The backing file of the virtual disk is on the system volume.
     * Native name: DEPENDENT_DISK_FLAG_SYSTEM_VOLUME_PARENT
     * @type {Integer (Int32)}
     */
    static SYSTEM_VOLUME_PARENT => 32

    /**
     * The backing file of the virtual disk is on a removable physical disk.
     * Native name: DEPENDENT_DISK_FLAG_REMOVABLE
     * @type {Integer (Int32)}
     */
    static REMOVABLE => 64

    /**
     * Drive letters are not automatically assigned to the volumes on the virtual disk.
     * Native name: DEPENDENT_DISK_FLAG_NO_DRIVE_LETTER
     * @type {Integer (Int32)}
     */
    static NO_DRIVE_LETTER => 128

    /**
     * The virtual disk is a parent of a differencing chain.
     * Native name: DEPENDENT_DISK_FLAG_PARENT
     * @type {Integer (Int32)}
     */
    static PARENT => 256

    /**
     * The virtual disk is not attached to the local host.
     *     For example, it is attached to a guest virtual machine.
     * Native name: DEPENDENT_DISK_FLAG_NO_HOST_DISK
     * @type {Integer (Int32)}
     */
    static NO_HOST_DISK => 512

    /**
     * The lifetime of the virtual disk is not tied to any application or process.
     * Native name: DEPENDENT_DISK_FLAG_PERMANENT_LIFETIME
     * @type {Integer (Int32)}
     */
    static PERMANENT_LIFETIME => 1024

    /**
     * Native name: DEPENDENT_DISK_FLAG_SUPPORT_COMPRESSED_VOLUMES
     * @type {Integer (Int32)}
     */
    static SUPPORT_COMPRESSED_VOLUMES => 2048

    /**
     * Native name: DEPENDENT_DISK_FLAG_ALWAYS_ALLOW_SPARSE
     * @type {Integer (Int32)}
     */
    static ALWAYS_ALLOW_SPARSE => 4096

    /**
     * Native name: DEPENDENT_DISK_FLAG_SUPPORT_ENCRYPTED_FILES
     * @type {Integer (Int32)}
     */
    static SUPPORT_ENCRYPTED_FILES => 8192
}
