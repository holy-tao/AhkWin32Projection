#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The FilterType enumeration specifies the type of filter used for an RSVP FILTERSPEC.
 * @see https://docs.microsoft.com/windows/win32/api//qossp/ne-qossp-filtertype
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class FilterType extends Win32Enum{

    /**
     * Indicates an IPv4 FILTERSPEC.
     * @type {Integer (Int32)}
     */
    static FILTERSPECV4 => 1

    /**
     * Indicates an IPv6 FILTERSPEC.
     * @type {Integer (Int32)}
     */
    static FILTERSPECV6 => 2

    /**
     * Indicates  IPv6 FILTERSPEC flow information.
     * @type {Integer (Int32)}
     */
    static FILTERSPECV6_FLOW => 3

    /**
     * Indicates  IPv4 FILTERSPEC general port identifier information.
     * @type {Integer (Int32)}
     */
    static FILTERSPECV4_GPI => 4

    /**
     * Indicates  IPv6 FILTERSPEC general port identifier information.
     * @type {Integer (Int32)}
     */
    static FILTERSPECV6_GPI => 5

    /**
     * Indicates  the end of the FILTERSPEC information.
     * @type {Integer (Int32)}
     */
    static FILTERSPEC_END => 6
}
