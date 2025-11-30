#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of impersonation to perform when Authenticated Internet Protocol (AuthIP) is used for authentication.
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ne-iketypes-ikeext_authentication_impersonation_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE extends Win32Enum{

    /**
     * Specifies no impersonation.
     * @type {Integer (Int32)}
     */
    static IKEEXT_IMPERSONATION_NONE => 0

    /**
     * Specifies socket principal impersonation.
     * @type {Integer (Int32)}
     */
    static IKEEXT_IMPERSONATION_SOCKET_PRINCIPAL => 1

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static IKEEXT_IMPERSONATION_MAX => 2
}
