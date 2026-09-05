#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_C_AUTHN_INFO_TYPE extends Win32Enum {

    /**
     * Native name: RPC_C_AUTHN_INFO_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: RPC_C_AUTHN_INFO_TYPE_HTTP
     * @type {Integer (UInt32)}
     */
    static HTTP => 1
}
