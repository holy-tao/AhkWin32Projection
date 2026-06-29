#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An enumeration of the different operation styles.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_operation_style
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_OPERATION_STYLE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
