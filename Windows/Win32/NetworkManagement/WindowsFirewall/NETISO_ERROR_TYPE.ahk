#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NETISO_ERROR_TYPE enumeration specifies the type of error related to a network isolation operation.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ne-netfw-netiso_error_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class NETISO_ERROR_TYPE extends Win32Enum {

    /**
     * No error.
     * Native name: NETISO_ERROR_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The failure was caused because the privateNetworkClientServer capability is missing.
     * Native name: NETISO_ERROR_TYPE_PRIVATE_NETWORK
     * @type {Integer (Int32)}
     */
    static PRIVATE_NETWORK => 1

    /**
     * The failure was caused because the internetClient capability is missing.
     * Native name: NETISO_ERROR_TYPE_INTERNET_CLIENT
     * @type {Integer (Int32)}
     */
    static INTERNET_CLIENT => 2

    /**
     * The failure was caused because the internetClientServer capability is missing.
     * Native name: NETISO_ERROR_TYPE_INTERNET_CLIENT_SERVER
     * @type {Integer (Int32)}
     */
    static INTERNET_CLIENT_SERVER => 3

    /**
     * Maximum value for testing purposes.
     * Native name: NETISO_ERROR_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 4
}
