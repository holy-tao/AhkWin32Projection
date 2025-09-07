#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of possible EAP authentication session status values during the authentication process.
 * @see https://learn.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphost_auth_status
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAPHOST_AUTH_STATUS{

    /**
     * The EAP authentication session is no longer valid.
     * @type {Integer (Int32)}
     */
    static EapHostInvalidSession => 0

    /**
     * The authentication session has not started yet.
     * @type {Integer (Int32)}
     */
    static EapHostAuthNotStarted => 1

    /**
     * The supplicant is providing a user identity in order to begin the EAP authentication session.
     * @type {Integer (Int32)}
     */
    static EapHostAuthIdentityExchange => 2

    /**
     * The supplicant is negotiating the EAP method type to use for authentication.
     * @type {Integer (Int32)}
     */
    static EapHostAuthNegotiatingType => 3

    /**
     * The authentication session is in progress.
     * @type {Integer (Int32)}
     */
    static EapHostAuthInProgress => 4

    /**
     * The EAP authentication session completed successfully, and authentication was successful.
     * @type {Integer (Int32)}
     */
    static EapHostAuthSucceeded => 5

    /**
     * The EAP authentication session completed successfully, but authentication failed.
     * @type {Integer (Int32)}
     */
    static EapHostAuthFailed => 6
}
