#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of possible isolation state values of a machine.
 * @remarks
 * 
 * Network Access Protection (NAP) uses the <b>ISOLATION_STATE</b> value to determine if a client should be granted  network access.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//eaphostpeertypes/ne-eaphostpeertypes-isolation_state
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class ISOLATION_STATE{

    /**
     * The client's access to the network is unknown.
     * @type {Integer (Int32)}
     */
    static ISOLATION_STATE_UNKNOWN => 0

    /**
     * The client has unrestricted full access to the network.
     * @type {Integer (Int32)}
     */
    static ISOLATION_STATE_NOT_RESTRICTED => 1

    /**
     * The client has probationary access to the network for a limited amount of time during which time they must fix their system.
     * @type {Integer (Int32)}
     */
    static ISOLATION_STATE_IN_PROBATION => 2

    /**
     * The client has restricted access to the network; the client is allowed access to some servers only from which they can obtain necessary information and patches to update themselves to become healthy.
     * @type {Integer (Int32)}
     */
    static ISOLATION_STATE_RESTRICTED_ACCESS => 3
}
