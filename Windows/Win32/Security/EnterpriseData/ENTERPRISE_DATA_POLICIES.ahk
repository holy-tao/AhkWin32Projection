#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether the app is enlightened for Windows Information Protection (WIP) and whether the app is managed by policy.
 * @see https://learn.microsoft.com/windows/win32/api/srpapi/ne-srpapi-enterprise_data_policies
 * @namespace Windows.Win32.Security.EnterpriseData
 */
class ENTERPRISE_DATA_POLICIES extends Win32BitflagEnum {

    /**
     * The app is not managed by enterprise policy.
     * Native name: ENTERPRISE_POLICY_NONE
     * @type {Integer (Int32)}
     */
    static POLICY_NONE => 0

    /**
     * The app is allowed to access enterprise resources according to the enterprise policy.
     * Native name: ENTERPRISE_POLICY_ALLOWED
     * @type {Integer (Int32)}
     */
    static POLICY_ALLOWED => 1

    /**
     * The app is enlightened (self-declared in the app's resource file).
     * Native name: ENTERPRISE_POLICY_ENLIGHTENED
     * @type {Integer (Int32)}
     */
    static POLICY_ENLIGHTENED => 2

    /**
     * The app is marked as exempt by the enterprise policy.
     * Native name: ENTERPRISE_POLICY_EXEMPT
     * @type {Integer (Int32)}
     */
    static POLICY_EXEMPT => 4
}
