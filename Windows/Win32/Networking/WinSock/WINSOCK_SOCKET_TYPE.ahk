#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WINSOCK_SOCKET_TYPE {
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
    static SOCK_STREAM => 1

    /**
     * @type {Integer (Int32)}
     */
    static SOCK_DGRAM => 2

    /**
     * @type {Integer (Int32)}
     */
    static SOCK_RAW => 3

    /**
     * @type {Integer (Int32)}
     */
    static SOCK_RDM => 4

    /**
     * @type {Integer (Int32)}
     */
    static SOCK_SEQPACKET => 5
}
