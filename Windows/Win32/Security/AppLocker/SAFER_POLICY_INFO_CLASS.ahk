#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the ways in which a policy may be queried.
 * @remarks
 * The <b>SAFER_POLICY_INFO_CLASS</b> enumeration type is used by the <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/nf-winsafer-safergetpolicyinformation">SaferGetPolicyInformation</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/ne-winsafer-safer_policy_info_class
 * @namespace Windows.Win32.Security.AppLocker
 */
class SAFER_POLICY_INFO_CLASS extends Win32Enum {

    /**
     * Queries for the list of all levels defined in a policy.
     * Native name: SaferPolicyLevelList
     * @type {Integer (Int32)}
     */
    static LevelList => 1

    /**
     * Queries for the policy value to determine whether DLL checking is enabled.
     * Native name: SaferPolicyEnableTransparentEnforcement
     * @type {Integer (Int32)}
     */
    static EnableTransparentEnforcement => 2

    /**
     * Queries for the default policy level.
     * Native name: SaferPolicyDefaultLevel
     * @type {Integer (Int32)}
     */
    static DefaultLevel => 3

    /**
     * Queries to determine whether user scope rules should be consulted during policy evaluation.
     * Native name: SaferPolicyEvaluateUserScope
     * @type {Integer (Int32)}
     */
    static EvaluateUserScope => 4

    /**
     * Queries to determine whether the policy is to skip members of the local administrators group.
     * Native name: SaferPolicyScopeFlags
     * @type {Integer (Int32)}
     */
    static ScopeFlags => 5

    /**
     * Native name: SaferPolicyDefaultLevelFlags
     * @type {Integer (Int32)}
     */
    static DefaultLevelFlags => 6

    /**
     * Native name: SaferPolicyAuthenticodeEnabled
     * @type {Integer (Int32)}
     */
    static AuthenticodeEnabled => 7
}
