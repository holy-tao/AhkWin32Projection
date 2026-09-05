#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Placeholder data hydration flags.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_hydrate_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 */
class CF_HYDRATE_FLAGS extends Win32BitflagEnum {

    /**
     * No hydration flags.
     * Native name: CF_HYDRATE_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0
}
