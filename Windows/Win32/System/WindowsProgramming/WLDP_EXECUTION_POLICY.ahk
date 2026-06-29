#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @see https://learn.microsoft.com/windows/win32/api/wldp/ne-wldp-wldp_execution_policy
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct WLDP_EXECUTION_POLICY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
