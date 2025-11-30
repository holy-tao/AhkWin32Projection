#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _TRANSFER_SOURCE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TSF_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static TSF_FAIL_EXIST => 0

    /**
     * @type {Integer (Int32)}
     */
    static TSF_RENAME_EXIST => 1

    /**
     * @type {Integer (Int32)}
     */
    static TSF_OVERWRITE_EXIST => 2

    /**
     * @type {Integer (Int32)}
     */
    static TSF_ALLOW_DECRYPTION => 4

    /**
     * @type {Integer (Int32)}
     */
    static TSF_NO_SECURITY => 8

    /**
     * @type {Integer (Int32)}
     */
    static TSF_COPY_CREATION_TIME => 16

    /**
     * @type {Integer (Int32)}
     */
    static TSF_COPY_WRITE_TIME => 32

    /**
     * @type {Integer (Int32)}
     */
    static TSF_USE_FULL_ACCESS => 64

    /**
     * @type {Integer (Int32)}
     */
    static TSF_DELETE_RECYCLE_IF_POSSIBLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static TSF_COPY_HARD_LINK => 256

    /**
     * @type {Integer (Int32)}
     */
    static TSF_COPY_LOCALIZED_NAME => 512

    /**
     * @type {Integer (Int32)}
     */
    static TSF_MOVE_AS_COPY_DELETE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static TSF_SUSPEND_SHELLEVENTS => 2048
}
