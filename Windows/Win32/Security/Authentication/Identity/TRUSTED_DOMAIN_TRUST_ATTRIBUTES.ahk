#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TRUSTED_DOMAIN_TRUST_ATTRIBUTES {
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
    static TRUST_ATTRIBUTE_NON_TRANSITIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_UPLEVEL_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_FILTER_SIDS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_FOREST_TRANSITIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_CROSS_ORGANIZATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_TREAT_AS_EXTERNAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_ATTRIBUTE_WITHIN_FOREST => 32
}
