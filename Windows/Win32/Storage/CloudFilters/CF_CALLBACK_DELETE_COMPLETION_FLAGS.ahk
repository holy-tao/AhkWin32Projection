#Requires AutoHotkey v2.0.0 64-bit

/**
 * Callback flags for notifying a sync provider that a placeholder was successfully deleted.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_callback_delete_completion_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_DELETE_COMPLETION_FLAGS{

    /**
     * No delete completion flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_DELETE_COMPLETION_FLAG_NONE => 0
}
