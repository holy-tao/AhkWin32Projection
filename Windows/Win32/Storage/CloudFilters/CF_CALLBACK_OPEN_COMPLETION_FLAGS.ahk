#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Callback flags for notifying a sync provider that a placeholder was successfully opened for read/write/delete access.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_callback_open_completion_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_OPEN_COMPLETION_FLAGS extends Win32BitflagEnum{

    /**
     * No open completion flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_OPEN_COMPLETION_FLAG_NONE => 0

    /**
     * A flag set if the placeholder metadata is corrupted.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_OPEN_COMPLETION_FLAG_PLACEHOLDER_UNKNOWN => 1

    /**
     * A flag set if the placeholder metadata is not supported.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_OPEN_COMPLETION_FLAG_PLACEHOLDER_UNSUPPORTED => 2
}
