#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used when dispatching change notifications to subscribers.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ne-fwpmtypes-fwpm_change_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_CHANGE_TYPE{

    /**
     * Specifies an add change notification.
     * @type {Integer (Int32)}
     */
    static FWPM_CHANGE_ADD => 1

    /**
     * Specifies a delete change notification.
     * @type {Integer (Int32)}
     */
    static FWPM_CHANGE_DELETE => 2

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWPM_CHANGE_TYPE_MAX => 3
}
