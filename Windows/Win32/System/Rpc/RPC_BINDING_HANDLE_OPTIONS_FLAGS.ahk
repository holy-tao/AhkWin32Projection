#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_BINDING_HANDLE_OPTIONS_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: RPC_BHO_NONCAUSAL
     * @type {Integer (UInt32)}
     */
    static BHO_NONCAUSAL => 1

    /**
     * Native name: RPC_BHO_DONTLINGER
     * @type {Integer (UInt32)}
     */
    static BHO_DONTLINGER => 2
}
