#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_BINDING_HANDLE_OPTIONS_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_BHO_NONCAUSAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_BHO_DONTLINGER => 2
}
