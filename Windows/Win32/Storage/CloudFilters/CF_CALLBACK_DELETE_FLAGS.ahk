#Requires AutoHotkey v2.0.0 64-bit

/**
 * This callback is used to inform the sync provider that a placeholder file or directory under one of its sync roots is about to be deleted.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_callback_delete_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_DELETE_FLAGS{

    /**
     * No delete flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DELETE_FLAG_NONE => 0

    /**
     * The placeholder that is about to be deleted is a directory.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DELETE_FLAG_IS_DIRECTORY => 1

    /**
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DELETE_FLAG_IS_UNDELETE => 2
}
