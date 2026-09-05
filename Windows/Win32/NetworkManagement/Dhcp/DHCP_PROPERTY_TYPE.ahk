#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_PROPERTY_TYPE extends Win32Enum {

    /**
     * Native name: DhcpPropTypeByte
     * @type {Integer (Int32)}
     */
    static PropTypeByte => 0

    /**
     * Native name: DhcpPropTypeWord
     * @type {Integer (Int32)}
     */
    static PropTypeWord => 1

    /**
     * Native name: DhcpPropTypeDword
     * @type {Integer (Int32)}
     */
    static PropTypeDword => 2

    /**
     * Native name: DhcpPropTypeString
     * @type {Integer (Int32)}
     */
    static PropTypeString => 3

    /**
     * Native name: DhcpPropTypeBinary
     * @type {Integer (Int32)}
     */
    static PropTypeBinary => 4
}
