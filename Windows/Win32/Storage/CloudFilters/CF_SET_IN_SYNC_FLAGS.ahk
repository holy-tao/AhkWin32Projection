#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The in-sync state flags for placeholder files and folders.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_set_in_sync_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_SET_IN_SYNC_FLAGS extends Win32BitflagEnum{

    /**
     * No in-sync flag.
     * @type {Integer (Int32)}
     */
    static CF_SET_IN_SYNC_FLAG_NONE => 0
}
