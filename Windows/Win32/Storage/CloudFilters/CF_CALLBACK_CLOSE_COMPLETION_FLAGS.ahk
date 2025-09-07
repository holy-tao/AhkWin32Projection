#Requires AutoHotkey v2.0.0 64-bit

/**
 * Callback flags for notifying a sync provider that a placeholder under one of its sync roots that has been previously opened for read/write/delete access is now closed.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_close_completion_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_CLOSE_COMPLETION_FLAGS{

    /**
     * No close completion flags.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_CLOSE_COMPLETION_FLAG_NONE => 0

    /**
     * A flag set if a placeholder is deleted as a result of the close.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_CLOSE_COMPLETION_FLAG_DELETED => 1
}
