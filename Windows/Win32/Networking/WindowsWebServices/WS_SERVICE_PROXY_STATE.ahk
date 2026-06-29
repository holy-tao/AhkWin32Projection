#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The state of the service proxy.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_service_proxy_state
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_PROXY_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_PROXY_STATE_CREATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_PROXY_STATE_OPENING => 1

    /**
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_PROXY_STATE_OPEN => 2

    /**
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_PROXY_STATE_CLOSING => 3

    /**
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_PROXY_STATE_CLOSED => 4

    /**
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_PROXY_STATE_FAULTED => 5
}
