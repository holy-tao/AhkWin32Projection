#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_C_HTTP_AUTHN_TARGET extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_AUTHN_TARGET_SERVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_HTTP_AUTHN_TARGET_PROXY => 2
}
