#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of comparison to perform in the IOfflineFilesItemFilter::GetTimeFilter method.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_compare
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OFFLINEFILES_COMPARE{

    /**
     * Check whether the item value is equal to the filter value.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_COMPARE_EQ => 0

    /**
     * Check whether the item value is not equal to the filter value.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_COMPARE_NEQ => 1

    /**
     * Check whether the item value is less than the filter value.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_COMPARE_LT => 2

    /**
     * Check whether the item value is greater than the filter value.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_COMPARE_GT => 3

    /**
     * Check whether the item value is less than or equal to the filter value.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_COMPARE_LTE => 4

    /**
     * Check whether the item value is greater than or equal to the filter value.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_COMPARE_GTE => 5
}
