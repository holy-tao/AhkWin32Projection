#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of impersonation to perform when Authenticated Internet Protocol (AuthIP) is used for authentication.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_impersonation_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE extends Win32Enum {

    /**
     * Specifies no impersonation.
     * Native name: IKEEXT_IMPERSONATION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Specifies socket principal impersonation.
     * Native name: IKEEXT_IMPERSONATION_SOCKET_PRINCIPAL
     * @type {Integer (Int32)}
     */
    static SOCKET_PRINCIPAL => 1

    /**
     * Maximum value for testing purposes.
     * Native name: IKEEXT_IMPERSONATION_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2
}
