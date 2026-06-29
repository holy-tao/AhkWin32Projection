#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct CLIENT_MESSAGE_TYPE {
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
    static CLIENT_MESSAGE_CONNECTION_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLIENT_MESSAGE_CONNECTION_STATUS => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLIENT_MESSAGE_CONNECTION_ERROR => 2
}
