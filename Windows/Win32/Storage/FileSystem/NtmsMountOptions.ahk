#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsMountOptions extends Win32Enum {

    /**
     * Native name: NTMS_MOUNT_READ
     * @type {Integer (Int32)}
     */
    static READ => 1

    /**
     * Native name: NTMS_MOUNT_WRITE
     * @type {Integer (Int32)}
     */
    static WRITE => 2

    /**
     * Native name: NTMS_MOUNT_ERROR_NOT_AVAILABLE
     * @type {Integer (Int32)}
     */
    static ERROR_NOT_AVAILABLE => 4

    /**
     * Native name: NTMS_MOUNT_ERROR_IF_UNAVAILABLE
     * @type {Integer (Int32)}
     */
    static ERROR_IF_UNAVAILABLE => 4

    /**
     * Native name: NTMS_MOUNT_ERROR_OFFLINE
     * @type {Integer (Int32)}
     */
    static ERROR_OFFLINE => 8

    /**
     * Native name: NTMS_MOUNT_ERROR_IF_OFFLINE
     * @type {Integer (Int32)}
     */
    static ERROR_IF_OFFLINE => 8

    /**
     * Native name: NTMS_MOUNT_SPECIFIC_DRIVE
     * @type {Integer (Int32)}
     */
    static SPECIFIC_DRIVE => 16

    /**
     * Native name: NTMS_MOUNT_NOWAIT
     * @type {Integer (Int32)}
     */
    static NOWAIT => 32
}
