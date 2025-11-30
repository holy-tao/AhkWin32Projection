#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether the app is enlightened for Windows Information Protection (WIP) and whether the app is managed by policy.
 * @see https://docs.microsoft.com/windows/win32/api//srpapi/ne-srpapi-enterprise_data_policies
 * @namespace Windows.Win32.Security.EnterpriseData
 * @version v4.0.30319
 */
class ENTERPRISE_DATA_POLICIES extends Win32BitflagEnum{

    /**
     * The app is not managed by enterprise policy.
     * @type {Integer (Int32)}
     */
    static ENTERPRISE_POLICY_NONE => 0

    /**
     * The app is allowed to access enterprise resources according to the enterprise policy.
     * @type {Integer (Int32)}
     */
    static ENTERPRISE_POLICY_ALLOWED => 1

    /**
     * The app is enlightened (self-declared in the app's resource file).
     * @type {Integer (Int32)}
     */
    static ENTERPRISE_POLICY_ENLIGHTENED => 2

    /**
     * The app is marked as exempt by the enterprise policy.
     * @type {Integer (Int32)}
     */
    static ENTERPRISE_POLICY_EXEMPT => 4
}
