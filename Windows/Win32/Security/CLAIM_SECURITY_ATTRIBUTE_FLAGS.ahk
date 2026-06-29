#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct CLAIM_SECURITY_ATTRIBUTE_FLAGS {
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
    static CLAIM_SECURITY_ATTRIBUTE_NON_INHERITABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_USE_FOR_DENY_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_DISABLED_BY_DEFAULT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_DISABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_MANDATORY => 32
}
