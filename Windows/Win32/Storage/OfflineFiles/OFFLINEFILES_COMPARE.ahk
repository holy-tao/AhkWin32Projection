#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of comparison to perform in the IOfflineFilesItemFilter::GetTimeFilter method.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_compare
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
class OFFLINEFILES_COMPARE extends Win32Enum {

    /**
     * Check whether the item value is equal to the filter value.
     * Native name: OFFLINEFILES_COMPARE_EQ
     * @type {Integer (Int32)}
     */
    static EQ => 0

    /**
     * Check whether the item value is not equal to the filter value.
     * Native name: OFFLINEFILES_COMPARE_NEQ
     * @type {Integer (Int32)}
     */
    static NEQ => 1

    /**
     * Check whether the item value is less than the filter value.
     * Native name: OFFLINEFILES_COMPARE_LT
     * @type {Integer (Int32)}
     */
    static LT => 2

    /**
     * Check whether the item value is greater than the filter value.
     * Native name: OFFLINEFILES_COMPARE_GT
     * @type {Integer (Int32)}
     */
    static GT => 3

    /**
     * Check whether the item value is less than or equal to the filter value.
     * Native name: OFFLINEFILES_COMPARE_LTE
     * @type {Integer (Int32)}
     */
    static LTE => 4

    /**
     * Check whether the item value is greater than or equal to the filter value.
     * Native name: OFFLINEFILES_COMPARE_GTE
     * @type {Integer (Int32)}
     */
    static GTE => 5
}
