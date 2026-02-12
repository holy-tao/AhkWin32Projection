#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how many days of email to keep on the client.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountmailagefilter
 * @namespace Windows.ApplicationModel.UserDataAccounts.SystemAccess
 * @version WindowsRuntime 1.4
 */
class DeviceAccountMailAgeFilter extends Win32Enum{

    /**
     * Keep all the email.
     * @type {Integer (Int32)}
     */
    static All => 0

    /**
     * Keep email from the last day.
     * @type {Integer (Int32)}
     */
    static Last1Day => 1

    /**
     * Keep email from the last 3 days.
     * @type {Integer (Int32)}
     */
    static Last3Days => 2

    /**
     * Keep email from the last 7 days.
     * @type {Integer (Int32)}
     */
    static Last7Days => 3

    /**
     * Keep email from the last 14 days.
     * @type {Integer (Int32)}
     */
    static Last14Days => 4

    /**
     * Keep email from the last 30 days.
     * @type {Integer (Int32)}
     */
    static Last30Days => 5

    /**
     * Keep email from the last 90 days.
     * @type {Integer (Int32)}
     */
    static Last90Days => 6
}
