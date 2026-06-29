#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct NS_EVENTS {
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
    static NS_EVENT_LOOP => 65536

    /**
     * @type {Integer (Int32)}
     */
    static NS_EVENT_LAST_N => 1

    /**
     * @type {Integer (Int32)}
     */
    static NS_EVENT_LAST_SECS => 2

    /**
     * @type {Integer (Int32)}
     */
    static NS_EVENT_FROM_N => 4

    /**
     * @type {Integer (Int32)}
     */
    static NS_EVENT_FROM_START => 8
}
