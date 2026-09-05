#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The StatusCode enum contains status codes for IPv6 operations.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpv6csdk/ne-dhcpv6csdk-statuscode
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class StatusCode extends Win32Enum {

    /**
     * Native name: STATUS_NO_ERROR
     * @type {Integer (Int32)}
     */
    static NO_ERROR => 0

    /**
     * Native name: STATUS_UNSPECIFIED_FAILURE
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED_FAILURE => 1

    /**
     * Native name: STATUS_NO_BINDING
     * @type {Integer (Int32)}
     */
    static NO_BINDING => 3

    /**
     * Native name: STATUS_NOPREFIX_AVAIL
     * @type {Integer (Int32)}
     */
    static NOPREFIX_AVAIL => 6
}
