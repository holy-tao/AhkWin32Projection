#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of error related to a network isolation operation.
 * @see https://docs.microsoft.com/windows/win32/api//networkisolation/ne-networkisolation-netiso_error_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NETISO_ERROR_TYPE{

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
