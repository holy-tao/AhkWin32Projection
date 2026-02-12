#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Represents the prompt type of a web token request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.web.core.webtokenrequestprompttype
 * @namespace Windows.Security.Authentication.Web.Core
 * @version WindowsRuntime 1.4
 */
class WebTokenRequestPromptType extends Win32Enum{

    /**
     * The default request type.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * A request with forced authentication. This will require the user to enter their credentials, regardless of whether they are already logged in.
     * @type {Integer (Int32)}
     */
    static ForceAuthentication => 1
}
