#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class AF_OP extends Win32BitflagEnum {

    /**
     * Native name: AF_OP_PRINT
     * @type {Integer (UInt32)}
     */
    static PRINT => 1

    /**
     * Native name: AF_OP_COMM
     * @type {Integer (UInt32)}
     */
    static COMM => 2

    /**
     * Native name: AF_OP_SERVER
     * @type {Integer (UInt32)}
     */
    static SERVER => 4

    /**
     * Native name: AF_OP_ACCOUNTS
     * @type {Integer (UInt32)}
     */
    static ACCOUNTS => 8
}
