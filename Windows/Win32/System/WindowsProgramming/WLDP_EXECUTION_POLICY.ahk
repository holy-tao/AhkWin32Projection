#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wldp/ne-wldp-wldp_execution_policy
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WLDP_EXECUTION_POLICY extends Win32Enum{

    /**
     * The subject does not pass execution policy and should not be executed.
     * @type {Integer (Int32)}
     */
    static WLDP_EXECUTION_POLICY_BLOCKED => 0

    /**
     * The subject passes execution policy and should be executed normally
     * @type {Integer (Int32)}
     */
    static WLDP_EXECUTION_POLICY_ALLOWED => 1

    /**
     * While the subject does not pass execution policy, the execution policy allows for execution in a sandbox-like mode if one is available for the host. If a sandbox mode is available for the host, the script may be executed in that mode. Otherwise, the execution of the subject should be aborted.
     * @type {Integer (Int32)}
     */
    static WLDP_EXECUTION_POLICY_REQUIRE_SANDBOX => 2
}
