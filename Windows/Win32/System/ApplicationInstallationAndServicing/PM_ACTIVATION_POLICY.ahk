#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_ACTIVATION_POLICY {
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
    static PM_ACTIVATION_POLICY_RESUME => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_RESUMESAMEPARAMS => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_REPLACE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_REPLACESAMEPARAMS => 3

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_MULTISESSION => 4

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_REPLACE_IGNOREFOREGROUND => 5

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_UNKNOWN => 6

    /**
     * @type {Integer (Int32)}
     */
    static PM_ACTIVATION_POLICY_INVALID => 7
}
