#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The type of user data content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountcontentkinds
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class UserDataAccountContentKinds extends Win32BitflagEnum{

    /**
     * Email data content.
     * @type {Integer (UInt32)}
     */
    static Email => 1

    /**
     * Contact data content.
     * @type {Integer (UInt32)}
     */
    static Contact => 2

    /**
     * Appointment data content.
     * @type {Integer (UInt32)}
     */
    static Appointment => 4
}
