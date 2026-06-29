#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of impersonation to perform when Authenticated Internet Protocol (AuthIP) is used for authentication.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_impersonation_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
