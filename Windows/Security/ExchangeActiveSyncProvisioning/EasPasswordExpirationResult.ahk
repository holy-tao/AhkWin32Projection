#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!NOTE]
  * > EasPasswordExpirationResult may be unavailable for releases after Windows 10.
  * 
  * Results of querying on the password expiration information. These values are mapped against the HRESULT codes returned from the EAS policy engine.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easpasswordexpirationresult
 * @namespace Windows.Security.ExchangeActiveSyncProvisioning
 * @version WindowsRuntime 1.4
 */
class EasPasswordExpirationResult extends Win32Enum{

    /**
     * The policy is not set for evaluation.
     * @type {Integer (Int32)}
     */
    static NotEvaluated => 0

    /**
     * The computer is compliant to the policy.HRESULT: S_OK and the user is controlled.
     * @type {Integer (Int32)}
     */
    static Compliant => 1

    /**
     * The computer can be compliant using the [ApplyAsync](easclientsecuritypolicy_applyasync_489349523.md) method.HRESULT: EAS_E_POLICY_COMPLIANT_WITH_ACTIONS and the user is an admin.
     * 
     * HRESULT: S_OK but the user is not controlled.
     * @type {Integer (Int32)}
     */
    static CanBeCompliant => 2

    /**
     * The requested policy is stricter than the computer policies.HRESULT: EAS_E_POLICY_COMPLIANT_WITH_ACTIONS and the user is not an admin.
     * @type {Integer (Int32)}
     */
    static RequestedPolicyIsStricter => 3

    /**
     * The EAS password expiration policy cannot be met as the password expiration interval is less than the minimum password interval for the system.HRESULT: EAS_E_REQUESTED_POLICY_PASSWORD_EXPIRATION_INCOMPATIBLE
     * @type {Integer (Int32)}
     */
    static RequestedExpirationIncompatible => 4

    /**
     * The policy value is not in a valid range.HRESULT: HRESULT_FROM_WIN32(ERROR_INVALID_PARAMETER)
     * @type {Integer (Int32)}
     */
    static InvalidParameter => 5

    /**
     * The user is not allowed to change the password. HRESULT: EAS_E_USER_CANNOT_CHANGE_PASSWORD
     * @type {Integer (Int32)}
     */
    static UserCannotChangePassword => 6

    /**
     * One or more admins are not allowed to change their passwords. HRESULT: EAS_E_ADMINS_CANNOT_CHANGE_PASSWORD
     * @type {Integer (Int32)}
     */
    static AdminsCannotChangePassword => 7

    /**
     * There are other standard users present who are not allowed to change their passwords. HRESULT: EAS_E_LOCAL_CONTROLLED_USERS_CANNOT_CHANGE_PASSWORD
     * @type {Integer (Int32)}
     */
    static LocalControlledUsersCannotChangePassword => 8
}
