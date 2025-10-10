#Requires AutoHotkey v2.0.0 64-bit

/**
 * An enumeration of the different operation styles.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_operation_style
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_OPERATION_STYLE{

    /**
     * document/literal style operation or encoding operations.
     * @type {Integer (Int32)}
     */
    static WS_NON_RPC_LITERAL_OPERATION => 0

    /**
     * rpc/literal style operation.
     * @type {Integer (Int32)}
     */
    static WS_RPC_LITERAL_OPERATION => 1
}
