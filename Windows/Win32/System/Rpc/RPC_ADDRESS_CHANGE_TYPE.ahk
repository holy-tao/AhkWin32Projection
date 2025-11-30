#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_ADDRESS_CHANGE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PROTOCOL_NOT_LOADED => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROTOCOL_LOADED => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROTOCOL_ADDRESS_CHANGE => 3
}
