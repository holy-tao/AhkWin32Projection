#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct SEND_RECV_FLAGS {
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
    static MSG_OOB => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSG_PEEK => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSG_DONTROUTE => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSG_WAITALL => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSG_PUSH_IMMEDIATE => 32
}
