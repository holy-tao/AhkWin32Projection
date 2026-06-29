#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The reasons for a cancellation.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_service_cancel_reason
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SERVICE_CANCEL_REASON {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A service host is going through an abort.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_HOST_ABORT => 0

    /**
     * The underlying channel faulted.
     * @type {Integer (Int32)}
     */
    static WS_SERVICE_CHANNEL_FAULTED => 1
}
