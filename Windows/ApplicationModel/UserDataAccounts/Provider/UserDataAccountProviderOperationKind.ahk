#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of an account operation.
 * @remarks
 * A Universal Windows Platform (UWP) app displays UI appropriate to the requested operation.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountprovideroperationkind
 * @namespace Windows.ApplicationModel.UserDataAccounts.Provider
 * @version WindowsRuntime 1.4
 */
class UserDataAccountProviderOperationKind extends Win32Enum{

    /**
     * An add account operation
     * @type {Integer (Int32)}
     */
    static AddAccount => 0

    /**
     * An account settings operation
     * @type {Integer (Int32)}
     */
    static Settings => 1

    /**
     * An operation to resolve errors on an account
     * @type {Integer (Int32)}
     */
    static ResolveErrors => 2
}
