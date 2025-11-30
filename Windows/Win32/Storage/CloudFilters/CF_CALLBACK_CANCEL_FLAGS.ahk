#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Callback flags for canceling data fetching for a placeholder file or folder.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_callback_cancel_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_CANCEL_FLAGS extends Win32BitflagEnum{

    /**
     * No cancel flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_CANCEL_FLAG_NONE => 0

    /**
     * Flag to be set if the user request is cancelled as a result of the expiration of the 60 second timer.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_CANCEL_FLAG_IO_TIMEOUT => 1

    /**
     * Flag to be set if the user request is cancelled as a result of the user explicitly terminating the hydration from app-initiated download toast.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_CANCEL_FLAG_IO_ABORTED => 2
}
