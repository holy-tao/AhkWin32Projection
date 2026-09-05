#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the filter enum conditions should be interpreted.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_filter_enum_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWP_FILTER_ENUM_TYPE extends Win32Enum {

    /**
     * Return only filters that fully contain the enum conditions.
     * Native name: FWP_FILTER_ENUM_FULLY_CONTAINED
     * @type {Integer (Int32)}
     */
    static FULLY_CONTAINED => 0

    /**
     * Return filters that overlap with the enum conditions, including filters that fully contain the enum conditions.
     * Native name: FWP_FILTER_ENUM_OVERLAPPING
     * @type {Integer (Int32)}
     */
    static OVERLAPPING => 1

    /**
     * Maximum value for testing purposes.
     * Native name: FWP_FILTER_ENUM_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2
}
