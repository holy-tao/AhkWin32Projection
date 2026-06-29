#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct DEP_SYSTEM_POLICY_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static DEPPolicyAlwaysOff => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEPPolicyAlwaysOn => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEPPolicyOptIn => 2

    /**
     * @type {Integer (Int32)}
     */
    static DEPPolicyOptOut => 3

    /**
     * @type {Integer (Int32)}
     */
    static DEPTotalPolicyCount => 4
}
