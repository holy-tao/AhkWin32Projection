#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains the status of the authentication operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.webauthenticationstatus
 * @namespace Windows.Security.Authentication.Web
 * @version WindowsRuntime 1.4
 */
class WebAuthenticationStatus extends Win32Enum{

    /**
     * The operation succeeded, and the response data is available.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The operation was canceled by the user.
     * @type {Integer (Int32)}
     */
    static UserCancel => 1

    /**
     * The operation failed because a specific HTTP error was returned, for example 404.
     * @type {Integer (Int32)}
     */
    static ErrorHttp => 2
}
