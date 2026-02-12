#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents the levels of information about a web account shown to the client.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.provider.webaccountclientviewtype
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class WebAccountClientViewType extends Win32Enum{

    /**
     * Shows only the Id.
     * @type {Integer (Int32)}
     */
    static IdOnly => 0

    /**
     * Shows the Id and properties.
     * @type {Integer (Int32)}
     */
    static IdAndProperties => 1
}
