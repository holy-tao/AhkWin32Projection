#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags for reverting a placeholder file to a regular file.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_revert_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_REVERT_FLAGS extends Win32BitflagEnum{

    /**
     * No placeholder revert flags.
     * @type {Integer (Int32)}
     */
    static CF_REVERT_FLAG_NONE => 0
}
