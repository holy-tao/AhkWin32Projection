#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_PROPERTY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DhcpPropTypeByte => 0

    /**
     * @type {Integer (Int32)}
     */
    static DhcpPropTypeWord => 1

    /**
     * @type {Integer (Int32)}
     */
    static DhcpPropTypeDword => 2

    /**
     * @type {Integer (Int32)}
     */
    static DhcpPropTypeString => 3

    /**
     * @type {Integer (Int32)}
     */
    static DhcpPropTypeBinary => 4
}
