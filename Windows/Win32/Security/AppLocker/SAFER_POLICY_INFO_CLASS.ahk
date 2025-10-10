#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the ways in which a policy may be queried.
 * @remarks
 * 
  * The <b>SAFER_POLICY_INFO_CLASS</b> enumeration type is used by the <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/nf-winsafer-safergetpolicyinformation">SaferGetPolicyInformation</a> function.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsafer/ne-winsafer-safer_policy_info_class
 * @namespace Windows.Win32.Security.AppLocker
 * @version v4.0.30319
 */
class SAFER_POLICY_INFO_CLASS{

    /**
     * Queries for the list of all levels defined in a policy.
     * @type {Integer (Int32)}
     */
    static SaferPolicyLevelList => 1

    /**
     * Queries for the policy value to determine whether DLL checking is enabled.
     * @type {Integer (Int32)}
     */
    static SaferPolicyEnableTransparentEnforcement => 2

    /**
     * Queries for the default policy level.
     * @type {Integer (Int32)}
     */
    static SaferPolicyDefaultLevel => 3

    /**
     * Queries to determine whether user scope rules should be consulted during policy evaluation.
     * @type {Integer (Int32)}
     */
    static SaferPolicyEvaluateUserScope => 4

    /**
     * Queries to determine whether the policy is to skip members of the local administrators group.
     * @type {Integer (Int32)}
     */
    static SaferPolicyScopeFlags => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SaferPolicyDefaultLevelFlags => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SaferPolicyAuthenticodeEnabled => 7
}
