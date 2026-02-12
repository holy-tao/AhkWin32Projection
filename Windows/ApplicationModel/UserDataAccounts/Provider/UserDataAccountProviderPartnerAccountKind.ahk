#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of the user data account.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdataaccounts.provider.userdataaccountproviderpartneraccountkind
 * @namespace Windows.ApplicationModel.UserDataAccounts.Provider
 * @version WindowsRuntime 1.4
 */
class UserDataAccountProviderPartnerAccountKind extends Win32Enum{

    /**
     * An Microsoft Exchange account
     * @type {Integer (Int32)}
     */
    static Exchange => 0

    /**
     * A POP or IMAP account
     * @type {Integer (Int32)}
     */
    static PopOrImap => 1
}
