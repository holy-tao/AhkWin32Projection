#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_FIND_TYPE {
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
    static CTL_FIND_ANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_SHA1_HASH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_MD5_HASH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_USAGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_SAME_USAGE_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_EXISTING => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CTL_FIND_SUBJECT => 4
}
