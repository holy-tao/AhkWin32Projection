#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SOCKET_PRIORITY_HINT {
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
    static SocketPriorityHintVeryLow => 0

    /**
     * @type {Integer (Int32)}
     */
    static SocketPriorityHintLow => 1

    /**
     * @type {Integer (Int32)}
     */
    static SocketPriorityHintNormal => 2

    /**
     * @type {Integer (Int32)}
     */
    static SocketMaximumPriorityHintType => 3
}
