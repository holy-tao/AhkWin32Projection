#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct NS_MODE_CHANGE {
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
    static NETSH_COMMIT => 0

    /**
     * @type {Integer (Int32)}
     */
    static NETSH_UNCOMMIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static NETSH_FLUSH => 2

    /**
     * @type {Integer (Int32)}
     */
    static NETSH_COMMIT_STATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static NETSH_SAVE => 4
}
