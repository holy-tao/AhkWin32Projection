#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents different operations a web account provider can perform. Use this to determine what operation to perform when the provider is activated. Providers must ignore unknown operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountprovideroperationkind
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebAccountProviderOperationKind extends Win32Enum{

    /**
     * Request an authentication token.
     * @type {Integer (Int32)}
     */
    static RequestToken => 0

    /**
     * Get an authentication token without showing any UI.
     * @type {Integer (Int32)}
     */
    static GetTokenSilently => 1

    /**
     * Add a web account.
     * @type {Integer (Int32)}
     */
    static AddAccount => 2

    /**
     * Manage a web account.
     * @type {Integer (Int32)}
     */
    static ManageAccount => 3

    /**
     * Delete a web account.
     * @type {Integer (Int32)}
     */
    static DeleteAccount => 4

    /**
     * Retrieve cookies.
     * @type {Integer (Int32)}
     */
    static RetrieveCookies => 5

    /**
     * Sign out a web account.
     * @type {Integer (Int32)}
     */
    static SignOutAccount => 6
}
