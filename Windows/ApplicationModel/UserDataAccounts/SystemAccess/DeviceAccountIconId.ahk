#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of icon to use for the device account.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccounticonid
 * @namespace Windows.ApplicationModel.UserDataAccounts.SystemAccess
 * @version WindowsRuntime 1.4
 */
class DeviceAccountIconId extends Win32Enum{

    /**
     * Uses the Exchange icon.
     * @type {Integer (Int32)}
     */
    static Exchange => 0

    /**
     * Uses the Microsoft account icon.
     * @type {Integer (Int32)}
     */
    static Msa => 1

    /**
     * Uses the Outlook icon.
     * @type {Integer (Int32)}
     */
    static Outlook => 2

    /**
     * Uses a generic account icon.
     * @type {Integer (Int32)}
     */
    static Generic => 3
}
