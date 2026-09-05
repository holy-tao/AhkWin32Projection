#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION extends Win32Enum {

    /**
     * Native name: MarshalDirectionMarshal
     * @type {Integer (Int32)}
     */
    static Marshal => 0

    /**
     * Native name: MarshalDirectionUnmarshal
     * @type {Integer (Int32)}
     */
    static Unmarshal => 1
}
