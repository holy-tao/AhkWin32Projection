#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * NLM_NETWORK_CLASS enumeration defines a set of flags that specify if a network has been identified.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_network_class
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct NLM_NETWORK_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The network is being identified.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_IDENTIFYING => 1

    /**
     * The network has been identified.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_IDENTIFIED => 2

    /**
     * The network has not been identified.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_UNIDENTIFIED => 3
}
