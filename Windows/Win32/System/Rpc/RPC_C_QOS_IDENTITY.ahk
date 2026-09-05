#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_C_QOS_IDENTITY extends Win32Enum {

    /**
     * Native name: RPC_C_QOS_IDENTITY_STATIC
     * @type {Integer (UInt32)}
     */
    static STATIC => 0

    /**
     * Native name: RPC_C_QOS_IDENTITY_DYNAMIC
     * @type {Integer (UInt32)}
     */
    static DYNAMIC => 1
}
