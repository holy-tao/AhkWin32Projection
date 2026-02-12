#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents the scope of a web account.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountscope
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebAccountScope extends Win32Enum{

    /**
     * Scope for single-sign-on accounts that appear in PC settings. This is the default scope.
     * @type {Integer (Int32)}
     */
    static PerUser => 0

    /**
     * Scope that hides the account from PC settings. Use this scope if you do not want the user's login to persist. For these accounts, only per-app tokens should be retained.
     * @type {Integer (Int32)}
     */
    static PerApplication => 1
}
