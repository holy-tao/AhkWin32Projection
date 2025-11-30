#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_HTTP_REDIRECTOR_STAGE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RPCHTTP_RS_REDIRECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static RPCHTTP_RS_ACCESS_1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static RPCHTTP_RS_SESSION => 3

    /**
     * @type {Integer (Int32)}
     */
    static RPCHTTP_RS_ACCESS_2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static RPCHTTP_RS_INTERFACE => 5
}
