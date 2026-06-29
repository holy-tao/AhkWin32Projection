#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NETISO_ERROR_TYPE enumeration specifies the type of error related to a network isolation operation.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ne-netfw-netiso_error_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct NETISO_ERROR_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No error.
     * @type {Integer (Int32)}
     */
    static NETISO_ERROR_TYPE_NONE => 0

    /**
     * The failure was caused because the privateNetworkClientServer capability is missing.
     * @type {Integer (Int32)}
     */
    static NETISO_ERROR_TYPE_PRIVATE_NETWORK => 1

    /**
     * The failure was caused because the internetClient capability is missing.
     * @type {Integer (Int32)}
     */
    static NETISO_ERROR_TYPE_INTERNET_CLIENT => 2

    /**
     * The failure was caused because the internetClientServer capability is missing.
     * @type {Integer (Int32)}
     */
    static NETISO_ERROR_TYPE_INTERNET_CLIENT_SERVER => 3

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static NETISO_ERROR_TYPE_MAX => 4
}
