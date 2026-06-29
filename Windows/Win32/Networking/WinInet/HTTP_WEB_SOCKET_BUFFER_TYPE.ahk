#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct HTTP_WEB_SOCKET_BUFFER_TYPE {
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
    static HTTP_WEB_SOCKET_BINARY_MESSAGE_TYPE => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_BINARY_FRAGMENT_TYPE => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_UTF8_MESSAGE_TYPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_UTF8_FRAGMENT_TYPE => 3

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_CLOSE_TYPE => 4

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_PING_TYPE => 5
}
