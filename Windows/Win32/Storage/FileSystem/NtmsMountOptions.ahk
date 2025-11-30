#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsMountOptions extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_WRITE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_ERROR_NOT_AVAILABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_ERROR_IF_UNAVAILABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_ERROR_OFFLINE => 8

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_ERROR_IF_OFFLINE => 8

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_SPECIFIC_DRIVE => 16

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_MOUNT_NOWAIT => 32
}
