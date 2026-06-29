#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_INT64 => 1

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_UINT64 => 2

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_STRING => 3

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_OCTET_STRING => 16

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_FQBN => 4

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_SID => 5

    /**
     * @type {Integer (UInt16)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_BOOLEAN => 6
}
