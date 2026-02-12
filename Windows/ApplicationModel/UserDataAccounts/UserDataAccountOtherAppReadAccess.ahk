#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the rights granted to other apps for reading this [UserDataAccount](userdataaccount.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountotherappreadaccess
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class UserDataAccountOtherAppReadAccess extends Win32Enum{

    /**
     * Only the operating system can read data from this [UserDataAccount](userdataaccount.md).
     * @type {Integer (Int32)}
     */
    static SystemOnly => 0

    /**
     * Other apps on the device can read all properties of this [UserDataAccount](userdataaccount.md).
     * @type {Integer (Int32)}
     */
    static Full => 1

    /**
     * Other apps on the device cannot read any properties of this [UserDataAccount](userdataaccount.md).
     * @type {Integer (Int32)}
     */
    static None => 2
}
