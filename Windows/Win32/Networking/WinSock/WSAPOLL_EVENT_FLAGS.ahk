#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSAPOLL_EVENT_FLAGS {
    value : Int16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int16)}
     */
    static POLLRDNORM => 256

    /**
     * @type {Integer (Int16)}
     */
    static POLLRDBAND => 512

    /**
     * @type {Integer (Int16)}
     */
    static POLLIN => 768

    /**
     * @type {Integer (Int16)}
     */
    static POLLPRI => 1024

    /**
     * @type {Integer (Int16)}
     */
    static POLLWRNORM => 16

    /**
     * @type {Integer (Int16)}
     */
    static POLLOUT => 16

    /**
     * @type {Integer (Int16)}
     */
    static POLLWRBAND => 32

    /**
     * @type {Integer (Int16)}
     */
    static POLLERR => 1

    /**
     * @type {Integer (Int16)}
     */
    static POLLHUP => 2

    /**
     * @type {Integer (Int16)}
     */
    static POLLNVAL => 4
}
