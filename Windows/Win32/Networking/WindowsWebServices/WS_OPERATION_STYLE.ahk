#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * An enumeration of the different operation styles.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_operation_style
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_OPERATION_STYLE extends Win32Enum {

    /**
     * document/literal style operation or encoding operations.
     * Native name: WS_NON_RPC_LITERAL_OPERATION
     * @type {Integer (Int32)}
     */
    static NON_RPC_LITERAL_OPERATION => 0

    /**
     * rpc/literal style operation.
     * Native name: WS_RPC_LITERAL_OPERATION
     * @type {Integer (Int32)}
     */
    static RPC_LITERAL_OPERATION => 1
}
