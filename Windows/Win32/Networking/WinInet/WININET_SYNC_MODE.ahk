#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct WININET_SYNC_MODE {
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
    static WININET_SYNC_MODE_NEVER => 0

    /**
     * @type {Integer (Int32)}
     */
    static WININET_SYNC_MODE_ON_EXPIRY => 1

    /**
     * @type {Integer (Int32)}
     */
    static WININET_SYNC_MODE_ONCE_PER_SESSION => 2

    /**
     * @type {Integer (Int32)}
     */
    static WININET_SYNC_MODE_ALWAYS => 3

    /**
     * @type {Integer (Int32)}
     */
    static WININET_SYNC_MODE_AUTOMATIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static WININET_SYNC_MODE_DEFAULT => 4
}
