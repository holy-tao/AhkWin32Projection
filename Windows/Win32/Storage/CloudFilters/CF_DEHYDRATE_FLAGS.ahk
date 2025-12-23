#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Placeholder dehydration flags.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_dehydrate_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_DEHYDRATE_FLAGS extends Win32BitflagEnum{

    /**
     * No dehydration flags.
     * @type {Integer (Int32)}
     */
    static CF_DEHYDRATE_FLAG_NONE => 0

    /**
     * If specified, the caller is a system process running in the background. Otherwise, the caller is performing this operation on behalf of a logged-in user.
     * @type {Integer (Int32)}
     */
    static CF_DEHYDRATE_FLAG_BACKGROUND => 1
}
