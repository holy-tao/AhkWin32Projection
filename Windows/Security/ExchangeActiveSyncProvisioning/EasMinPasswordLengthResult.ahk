#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!NOTE]
  * > EasMinPasswordLengthResult may be unavailable for releases after Windows 10.
  * 
  * Represents the minimum length result for passwords. These values are mapped against the HRESULT codes returned from the EAS policy engine.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easminpasswordlengthresult
 * @namespace Windows.Security.ExchangeActiveSyncProvisioning
 * @version WindowsRuntime 1.4
 */
class EasMinPasswordLengthResult extends Win32Enum{

    /**
     * The policy is not set for evaluation.
     * @type {Integer (Int32)}
     */
    static NotEvaluated => 0

    /**
     * This computer is compliant to the policy.HRESULT: S_OK and the user is controlled.
     * @type {Integer (Int32)}
     */
    static Compliant => 1

    /**
     * This computer can be compliant by using the [ApplyAsync](easclientsecuritypolicy_applyasync_489349523.md) method.HRESULT: EAS_E_POLICY_COMPLIANT_WITH_ACTIONS and the user is not an admin.
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
     * The EAS policy being evaluated cannot be enforced by the system.HRESULT: EAS_E_REQUESTED_POLICY_NOT_ENFORCEABLE
     * @type {Integer (Int32)}
     */
    static RequestedPolicyNotEnforceable => 4

    /**
     * The policy value is not in a valid range.HRESULT: HRESULT_FROM_WIN32(ERROR_INVALID_PARAMETER)
     * @type {Integer (Int32)}
     */
    static InvalidParameter => 5

    /**
     * The EAS password policies for the user cannot be evaluated as the user has a blank password.HRESULT: EAS_E_CURRENT_USER_HAS_BLANK_PASSWORD
     * @type {Integer (Int32)}
     */
    static CurrentUserHasBlankPassword => 6

    /**
     * The EAS password policies cannot be evaluated as one or more admins have blank passwords. HRESULT: EAS_E_ADMINS_HAVE_BLANK_PASSWORD
     * @type {Integer (Int32)}
     */
    static AdminsHaveBlankPassword => 7

    /**
     * The user is not allowed to change the password. HRESULT: EAS_E_USER_CANNOT_CHANGE_PASSWORD
     * @type {Integer (Int32)}
     */
    static UserCannotChangePassword => 8

    /**
     * One or more admins are not allowed to change their passwords. HRESULT: EAS_E_ADMINS_CANNOT_CHANGE_PASSWORD
     * @type {Integer (Int32)}
     */
    static AdminsCannotChangePassword => 9

    /**
     * There are other standard users present who are not allowed to change their passwords. HRESULT: EAS_E_LOCAL_CONTROLLED_USERS_CANNOT_CHANGE_PASSWORD
     * @type {Integer (Int32)}
     */
    static LocalControlledUsersCannotChangePassword => 10

    /**
     * The EAS password policy cannot be enforced by the connected account provider of at least one administrator.HRESULT: EAS_E_PASSWORD_POLICY_NOT_ENFORCEABLE_FOR_CONNECTED_ADMINS
     * @type {Integer (Int32)}
     */
    static ConnectedAdminsProviderPolicyIsWeak => 11

    /**
     * The EAS password policy cannot be enforced by the connected account provider of the current user.HRESULT: EAS_E_PASSWORD_POLICY_NOT_ENFORCEABLE_FOR_CURRENT_CONNECTED_USER
     * @type {Integer (Int32)}
     */
    static ConnectedUserProviderPolicyIsWeak => 12

    /**
     * There is at least one administrator whose connected account password must be changed for EAS password policy compliance.HRESULT: EAS_E_CONNECTED_ADMINS_NEED_TO_CHANGE_PASSWORD
     * @type {Integer (Int32)}
     */
    static ChangeConnectedAdminsPassword => 13

    /**
     * The connected account password for the current user must be changed for EAS password policy compliance.HRESULT: EAS_E_CURRENT_CONNECTED_USER_NEED_TO_CHANGE_PASSWORD
     * @type {Integer (Int32)}
     */
    static ChangeConnectedUserPassword => 14
}
