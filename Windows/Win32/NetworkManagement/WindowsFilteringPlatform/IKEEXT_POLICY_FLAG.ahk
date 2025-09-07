#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_POLICY_FLAG{

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_FLAG_DISABLE_DIAGNOSTICS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_FLAG_NO_MACHINE_LUID_VERIFY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_FLAG_NO_IMPERSONATION_LUID_VERIFY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_POLICY_FLAG_ENABLE_OPTIONAL_DH => 8
}
