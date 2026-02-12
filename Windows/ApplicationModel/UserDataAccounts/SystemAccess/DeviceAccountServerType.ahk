#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the server types for syncing.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountservertype
 * @namespace Windows.ApplicationModel.UserDataAccounts.SystemAccess
 * @version WindowsRuntime 1.4
 */
class DeviceAccountServerType extends Win32Enum{

    /**
     * Exchange server
     * @type {Integer (Int32)}
     */
    static Exchange => 0

    /**
     * POP server
     * @type {Integer (Int32)}
     */
    static Pop => 1

    /**
     * IMAP server
     * @type {Integer (Int32)}
     */
    static Imap => 2
}
