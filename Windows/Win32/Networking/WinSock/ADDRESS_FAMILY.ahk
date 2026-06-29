#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ADDRESS_FAMILY {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static AF_INET => 2

    /**
     * @type {Integer (UInt16)}
     */
    static AF_INET6 => 23

    /**
     * @type {Integer (UInt16)}
     */
    static AF_UNSPEC => 0
}
