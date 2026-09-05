#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Callback flags for notifying a sync provider that a placeholder was successfully opened for read/write/delete access.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_open_completion_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
class CF_CALLBACK_OPEN_COMPLETION_FLAGS extends Win32BitflagEnum {

    /**
     * No open completion flag.
     * Native name: CF_CALLBACK_OPEN_COMPLETION_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * A flag set if the placeholder metadata is corrupted.
     * Native name: CF_CALLBACK_OPEN_COMPLETION_FLAG_PLACEHOLDER_UNKNOWN
     * @type {Integer (Int32)}
     */
    static FLAG_PLACEHOLDER_UNKNOWN => 1

    /**
     * A flag set if the placeholder metadata is of an older and unsupported version.
     * Native name: CF_CALLBACK_OPEN_COMPLETION_FLAG_PLACEHOLDER_UNSUPPORTED
     * @type {Integer (Int32)}
     */
    static FLAG_PLACEHOLDER_UNSUPPORTED => 2
}
