#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * This API is for internal use only and should not be used in your code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.core.microsoftaccountmultifactorsessionapprovalstatus
 * @namespace Windows.Security.Authentication.Identity.Core
 * @version WindowsRuntime 1.4
 */
class MicrosoftAccountMultiFactorSessionApprovalStatus extends Win32Enum{

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static Pending => 0

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static Approved => 1

    /**
     * This API is for internal use only and should not be used in your code.
     * @type {Integer (Int32)}
     */
    static Denied => 2
}
