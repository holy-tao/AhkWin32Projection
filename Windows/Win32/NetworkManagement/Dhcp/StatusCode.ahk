#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The StatusCode enum contains status codes for IPv6 operations.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpv6csdk/ne-dhcpv6csdk-statuscode
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class StatusCode extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static STATUS_NO_ERROR => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static STATUS_UNSPECIFIED_FAILURE => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static STATUS_NO_BINDING => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static STATUS_NOPREFIX_AVAIL => 6
}
