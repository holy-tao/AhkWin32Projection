#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used when dispatching change notifications to subscribers.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_change_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_CHANGE_TYPE extends Win32Enum {

    /**
     * Specifies an add change notification.
     * Native name: FWPM_CHANGE_ADD
     * @type {Integer (Int32)}
     */
    static ADD => 1

    /**
     * Specifies a delete change notification.
     * Native name: FWPM_CHANGE_DELETE
     * @type {Integer (Int32)}
     */
    static DELETE => 2

    /**
     * Maximum value for testing purposes.
     * Native name: FWPM_CHANGE_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3
}
