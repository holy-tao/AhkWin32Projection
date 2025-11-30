#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class AF_OP extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static AF_OP_PRINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AF_OP_COMM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static AF_OP_SERVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AF_OP_ACCOUNTS => 8
}
