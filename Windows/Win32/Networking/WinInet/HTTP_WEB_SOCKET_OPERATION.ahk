#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct HTTP_WEB_SOCKET_OPERATION {
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
    static HTTP_WEB_SOCKET_SEND_OPERATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_RECEIVE_OPERATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_CLOSE_OPERATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_SHUTDOWN_OPERATION => 3
}
