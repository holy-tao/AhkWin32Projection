#Requires AutoHotkey v2.0.0 64-bit

/**
 * The RADIUS_REJECT_REASON_CODE enumeration defines the possible RADIUS packet reject codes.
 * @see https://learn.microsoft.com/windows/win32/api/authif/ne-authif-radius_reject_reason_code
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUS_REJECT_REASON_CODE{

    /**
     * Reason code undefined.
     * @type {Integer (Int32)}
     */
    static rrrcUndefined => 0

    /**
     * The authentication attempt is using a user name that does not correspond to any known account.
     * @type {Integer (Int32)}
     */
    static rrrcAccountUnknown => 1

    /**
     * The authentication attempt is using a user name that corresponds to an account that has been disabled by an administrator.
     * @type {Integer (Int32)}
     */
    static rrrcAccountDisabled => 2

    /**
     * The authentication attempt is using a user name that corresponds to an account that has  expired, either by exceeding its natural expiration lifetime or by administrative action.
     * @type {Integer (Int32)}
     */
    static rrrcAccountExpired => 3

    /**
     * The authentication process has failed; possibly due to incorrect credentials.
     * @type {Integer (Int32)}
     */
    static rrrcAuthenticationFailure => 4
}
