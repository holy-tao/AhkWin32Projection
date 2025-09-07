#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSAPOLL_EVENT_FLAGS{

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
