#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_POLICY_ID {
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
    static ImagePolicyIdNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdEtw => 1

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdDebug => 2

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdCrashDump => 3

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdCrashDumpKey => 4

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdCrashDumpKeyGuid => 5

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdParentSd => 6

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdParentSdRev => 7

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdSvn => 8

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdDeviceId => 9

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdCapability => 10

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdScenarioId => 11

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdCapabilityOverridable => 12

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdTrustletIdOverridable => 13

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyIdMaximum => 14
}
