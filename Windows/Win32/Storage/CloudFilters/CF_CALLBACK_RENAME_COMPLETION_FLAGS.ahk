#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A callback flag to inform the sync provider that a placeholder under one of its sync roots has been successfully renamed.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_callback_rename_completion_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_RENAME_COMPLETION_FLAGS extends Win32BitflagEnum{

    /**
     * No rename completion flag.
     * @type {Integer (Int32)}
     */
    static CF_CALLBACK_RENAME_COMPLETION_FLAG_NONE => 0
}
