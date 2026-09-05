#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class NET_USER_ENUM_FILTER_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: FILTER_TEMP_DUPLICATE_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static TEMP_DUPLICATE_ACCOUNT => 1

    /**
     * Native name: FILTER_NORMAL_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static NORMAL_ACCOUNT => 2

    /**
     * Native name: FILTER_INTERDOMAIN_TRUST_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static INTERDOMAIN_TRUST_ACCOUNT => 8

    /**
     * Native name: FILTER_WORKSTATION_TRUST_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static WORKSTATION_TRUST_ACCOUNT => 16

    /**
     * Native name: FILTER_SERVER_TRUST_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static SERVER_TRUST_ACCOUNT => 32
}
