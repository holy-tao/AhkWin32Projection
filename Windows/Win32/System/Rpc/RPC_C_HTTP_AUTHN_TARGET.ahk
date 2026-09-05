#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_C_HTTP_AUTHN_TARGET extends Win32BitflagEnum {

    /**
     * Native name: RPC_C_HTTP_AUTHN_TARGET_SERVER
     * @type {Integer (UInt32)}
     */
    static SERVER => 1

    /**
     * Native name: RPC_C_HTTP_AUTHN_TARGET_PROXY
     * @type {Integer (UInt32)}
     */
    static PROXY => 2
}
