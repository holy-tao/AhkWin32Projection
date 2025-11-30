#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_C_AUTHN_INFO_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_INFO_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_AUTHN_INFO_TYPE_HTTP => 1
}
