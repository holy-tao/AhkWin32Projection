#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wldp/ne-wldp-wldp_execution_policy
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WLDP_EXECUTION_POLICY{

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_EXECUTION_POLICY_BLOCKED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_EXECUTION_POLICY_ALLOWED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WLDP_EXECUTION_POLICY_REQUIRE_SANDBOX => 2
}
