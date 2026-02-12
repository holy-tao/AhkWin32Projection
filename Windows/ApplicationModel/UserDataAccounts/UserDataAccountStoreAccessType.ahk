#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the requested access type in a call to [RequestStoreAsync](userdataaccountmanager_requeststoreasync_1031356348.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.userdataaccountstoreaccesstype
 * @namespace Windows.ApplicationModel.UserDataAccounts
 * @version WindowsRuntime 1.4
 */
class UserDataAccountStoreAccessType extends Win32Enum{

    /**
     * Read-only access to app user data accounts and system user data accounts.
     * @type {Integer (Int32)}
     */
    static AllAccountsReadOnly => 0

    /**
     * Read/write access to the current app's user data accounts.
     * @type {Integer (Int32)}
     */
    static AppAccountsReadWrite => 1
}
