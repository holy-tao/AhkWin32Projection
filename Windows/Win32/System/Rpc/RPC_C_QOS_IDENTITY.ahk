#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_C_QOS_IDENTITY extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_IDENTITY_STATIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_IDENTITY_DYNAMIC => 1
}
