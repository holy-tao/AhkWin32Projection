#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by methods of the ITransferSource and ITransferDestination interfaces to control their file operations.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _TRANSFER_SOURCE_FLAGS extends Win32Enum{

    /**
     * Fail if the destination already exists, unless TSF_OVERWRITE_EXIST is specified. This is a default behavior.
     * @type {Integer (Int32)}
     */
    static TSF_NORMAL => 0

    /**
     * Fail if the destination already exists, unless TSF_OVERWRITE_EXIST is specified. This is a default behavior.
     * @type {Integer (Int32)}
     */
    static TSF_FAIL_EXIST => 0

    /**
     * Rename with auto-name generation if the destination already exists.
     * @type {Integer (Int32)}
     */
    static TSF_RENAME_EXIST => 1

    /**
     * Overwrite or merge with the destination.
     * @type {Integer (Int32)}
     */
    static TSF_OVERWRITE_EXIST => 2

    /**
     * Allow creation of a decrypted destination.
     * @type {Integer (Int32)}
     */
    static TSF_ALLOW_DECRYPTION => 4

    /**
     * No discretionary access control list (DACL), system access control list (SACL), or owner.
     * @type {Integer (Int32)}
     */
    static TSF_NO_SECURITY => 8

    /**
     * Copy the creation time as part of the copy. This can be useful for a move operation that is being used as a copy and delete operation (TSF_MOVE_AS_COPY_DELETE).
     * @type {Integer (Int32)}
     */
    static TSF_COPY_CREATION_TIME => 16

    /**
     * Copy the last write time as part of the copy.
     * @type {Integer (Int32)}
     */
    static TSF_COPY_WRITE_TIME => 32

    /**
     * Assign write, read, and delete permissions as share mode.
     * @type {Integer (Int32)}
     */
    static TSF_USE_FULL_ACCESS => 64

    /**
     * Recycle on file delete, if possible.
     * @type {Integer (Int32)}
     */
    static TSF_DELETE_RECYCLE_IF_POSSIBLE => 128

    /**
     * Hard link to the desired source (not required). This avoids a normal copy operation.
     * @type {Integer (Int32)}
     */
    static TSF_COPY_HARD_LINK => 256

    /**
     * Copy the localized name.
     * @type {Integer (Int32)}
     */
    static TSF_COPY_LOCALIZED_NAME => 512

    /**
     * Move as a copy and delete operation.
     * @type {Integer (Int32)}
     */
    static TSF_MOVE_AS_COPY_DELETE => 1024

    /**
     * Suspend Shell events.
     * @type {Integer (Int32)}
     */
    static TSF_SUSPEND_SHELLEVENTS => 2048
}
