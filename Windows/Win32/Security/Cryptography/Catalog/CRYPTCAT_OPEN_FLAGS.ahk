#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */
export default struct CRYPTCAT_OPEN_FLAGS {
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
    static CRYPTCAT_OPEN_ALWAYS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_OPEN_CREATENEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_OPEN_EXISTING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_OPEN_EXCLUDE_PAGE_HASHES => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_OPEN_INCLUDE_PAGE_HASHES => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_OPEN_VERIFYSIGHASH => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_OPEN_NO_CONTENT_HCRYPTMSG => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_OPEN_SORTED => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_OPEN_FLAGS_MASK => 4294901760
}
