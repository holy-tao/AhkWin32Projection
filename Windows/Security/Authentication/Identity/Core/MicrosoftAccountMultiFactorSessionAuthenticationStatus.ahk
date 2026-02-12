#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * This API is for internal use only and should not be used in your code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorsessionauthenticationstatus
 * @namespace Windows.Security.Authentication.Identity.Core
 * @version WindowsRuntime 1.4
 */
class MicrosoftAccountMultiFactorSessionAuthenticationStatus extends Win32Enum{

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static Authenticated => 0

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static Unauthenticated => 1
}
