#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TRUSTED_DOMAIN_TRUST_TYPE {
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
    static TRUST_TYPE_DOWNLEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_TYPE_UPLEVEL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_TYPE_MIT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_TYPE_DCE => 4
}
