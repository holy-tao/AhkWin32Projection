#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the number of events.
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ne-netsh-ns_reqs
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct NS_REQS {
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
    static NS_REQ_ZERO => 0

    /**
     * @type {Integer (Int32)}
     */
    static NS_REQ_PRESENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static NS_REQ_ALLOW_MULTIPLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NS_REQ_ONE_OR_MORE => 3
}
