#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class LRPC_SYSTEM_HANDLE_MARSHAL_DIRECTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MarshalDirectionMarshal => 0

    /**
     * @type {Integer (Int32)}
     */
    static MarshalDirectionUnmarshal => 1
}
