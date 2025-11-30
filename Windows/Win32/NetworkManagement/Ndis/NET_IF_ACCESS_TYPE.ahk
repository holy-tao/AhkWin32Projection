#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The NET_IF_ACCESS_TYPE enumeration type specifies the NDIS network interface access type.
 * @see https://docs.microsoft.com/windows/win32/api//ifdef/ne-ifdef-net_if_access_type
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NET_IF_ACCESS_TYPE extends Win32Enum{

    /**
     * Specifies the loopback access type. This access type indicates that the interface loops back
     *      transmit data as receive data.
     * @type {Integer (Int32)}
     */
    static NET_IF_ACCESS_LOOPBACK => 1

    /**
     * Specifies the LAN access type, which includes Ethernet. This access type indicates that the
     *      interface provides native support for multicast or broadcast services.
     * @type {Integer (Int32)}
     */
    static NET_IF_ACCESS_BROADCAST => 2

    /**
     * Specifies point-to-point access that supports CoNDIS and WAN, except for non-broadcast
     *      multi-access (NBMA) interfaces.
     * @type {Integer (Int32)}
     */
    static NET_IF_ACCESS_POINT_TO_POINT => 3

    /**
     * Specifies point-to-multipoint access that supports non-broadcast multi-access (NBMA) media,
     *      including the "RAS Internal" interface, and native (non-LANE) ATM.
     * @type {Integer (Int32)}
     */
    static NET_IF_ACCESS_POINT_TO_MULTI_POINT => 4

    /**
     * A maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static NET_IF_ACCESS_MAXIMUM => 5
}
