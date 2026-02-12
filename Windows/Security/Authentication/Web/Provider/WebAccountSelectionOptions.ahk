#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents web account selection options. Use this to support the use of multiple web accounts in an app, where user might choose to log in with an existing account or add a new account.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountselectionoptions
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebAccountSelectionOptions extends Win32BitflagEnum{

    /**
     * The user selected the default account.
     * @type {Integer (UInt32)}
     */
    static Default => 0

    /**
     * The user selected to add a new account.
     * @type {Integer (UInt32)}
     */
    static New => 1
}
