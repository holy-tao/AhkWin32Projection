#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NLM_DOMAIN_TYPE enumeration is a set of flags that specify the domain type of a network.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_domain_type
 * @namespace Windows.Win32.Networking.NetworkListManager
 */
export default struct NLM_DOMAIN_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The Network is not an Active Directory Network.
     * @type {Integer (Int32)}
     */
    static NLM_DOMAIN_TYPE_NON_DOMAIN_NETWORK => 0

    /**
     * The Network is an Active Directory Network, but this machine is not authenticated against it.
     * @type {Integer (Int32)}
     */
    static NLM_DOMAIN_TYPE_DOMAIN_NETWORK => 1

    /**
     * The Network is an Active Directory Network, and this machine is authenticated against it.
     * @type {Integer (Int32)}
     */
    static NLM_DOMAIN_TYPE_DOMAIN_AUTHENTICATED => 2
}
