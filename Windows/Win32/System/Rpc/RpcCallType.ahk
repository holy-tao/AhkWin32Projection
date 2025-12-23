#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the set of RPC call types.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ne-rpcasync-rpccalltype
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RpcCallType extends Win32Enum{

    /**
     * The remote procedure call is invalid.
     * @type {Integer (Int32)}
     */
    static rctInvalid => 0

    /**
     * The remote procedure call has no special properties.
     * @type {Integer (Int32)}
     */
    static rctNormal => 1

    /**
     * The remote procedure call is used for "training" RPC.
     * @type {Integer (Int32)}
     */
    static rctTraining => 2

    /**
     * The remote procedure call has guaranteed execution.
     * @type {Integer (Int32)}
     */
    static rctGuaranteed => 3
}
