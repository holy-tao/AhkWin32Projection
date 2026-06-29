#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_POLICY_FLAG {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
