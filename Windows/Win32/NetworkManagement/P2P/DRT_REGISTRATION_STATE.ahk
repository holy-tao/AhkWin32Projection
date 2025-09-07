#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DRT_REGISTRATION_STATE enumeration defines the set of legal states for a registered key.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ne-drt-drt_registration_state
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_REGISTRATION_STATE{

    /**
     * The locally registered key is no longer resolvable by other nodes. The Distributed Routing Table signals this state when the local security provider is unable to generate an authentication token for the locally registered key. 
 * 
 * For example, if the Derived Key Security Provider is used, this state is signaled when the certificate used to authenticate expires.
     * @type {Integer (Int32)}
     */
    static DRT_REGISTRATION_STATE_UNRESOLVEABLE => 1
}
