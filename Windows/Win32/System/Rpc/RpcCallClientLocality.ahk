#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the set of possible RPC client localities.
 * @see https://docs.microsoft.com/windows/win32/api//rpcasync/ne-rpcasync-rpccallclientlocality
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RpcCallClientLocality extends Win32Enum{

    /**
     * The RPC client locality is invalid.
     * @type {Integer (Int32)}
     */
    static rcclInvalid => 0

    /**
     * The RPC client is local.
     * @type {Integer (Int32)}
     */
    static rcclLocal => 1

    /**
     * The RPC client is remote.
     * @type {Integer (Int32)}
     */
    static rcclRemote => 2

    /**
     * The RPC client has an unknown locality.
     * @type {Integer (Int32)}
     */
    static rcclClientUnknownLocality => 3
}
