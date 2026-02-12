#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of authentication.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.systemaccess.deviceaccountauthenticationtype
 * @namespace Windows.ApplicationModel.UserDataAccounts.SystemAccess
 * @version WindowsRuntime 1.4
 */
class DeviceAccountAuthenticationType extends Win32Enum{

    /**
     * Uses a base64 encoded string that contains the user name and password.
     * @type {Integer (Int32)}
     */
    static Basic => 0

    /**
     * Uses OAuth for authentication.
     * @type {Integer (Int32)}
     */
    static OAuth => 1

    /**
     * Uses single sign on for authentication.
     * @type {Integer (Int32)}
     */
    static SingleSignOn => 2
}
