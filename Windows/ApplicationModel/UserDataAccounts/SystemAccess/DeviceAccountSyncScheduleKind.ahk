#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how often the account is synced.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountsyncschedulekind
 * @namespace Windows.ApplicationModel.UserDataAccounts.SystemAccess
 * @version WindowsRuntime 1.4
 */
class DeviceAccountSyncScheduleKind extends Win32Enum{

    /**
     * The account is synced manually.
     * @type {Integer (Int32)}
     */
    static Manual => 0

    /**
     * The account is synced every 15 minutes.
     * @type {Integer (Int32)}
     */
    static Every15Minutes => 1

    /**
     * The account is synced every 30 minutes.
     * @type {Integer (Int32)}
     */
    static Every30Minutes => 2

    /**
     * The account is synced every 60 minutes.
     * @type {Integer (Int32)}
     */
    static Every60Minutes => 3

    /**
     * The account is synced every 2 hours.
     * @type {Integer (Int32)}
     */
    static Every2Hours => 4

    /**
     * The account is synced once daily.
     * @type {Integer (Int32)}
     */
    static Daily => 5

    /**
     * The account is synced as items arrive at the server (push model).
     * @type {Integer (Int32)}
     */
    static AsItemsArrive => 6
}
