#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DRT_REGISTRATION_STATE enumeration defines the set of legal states for a registered key.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ne-drt-drt_registration_state
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_REGISTRATION_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The locally registered key is no longer resolvable by other nodes. The Distributed Routing Table signals this state when the local security provider is unable to generate an authentication token for the locally registered key. 
     * 
     * For example, if the Derived Key Security Provider is used, this state is signaled when the certificate used to authenticate expires.
     * @type {Integer (Int32)}
     */
    static DRT_REGISTRATION_STATE_UNRESOLVEABLE => 1
}
