#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_USER_ENUM_FILTER_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_TEMP_DUPLICATE_ACCOUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_NORMAL_ACCOUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_INTERDOMAIN_TRUST_ACCOUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_WORKSTATION_TRUST_ACCOUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILTER_SERVER_TRUST_ACCOUNT => 32
}
