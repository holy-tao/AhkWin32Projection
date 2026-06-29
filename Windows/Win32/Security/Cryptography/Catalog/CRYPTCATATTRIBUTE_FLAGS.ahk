#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */
export default struct CRYPTCATATTRIBUTE_FLAGS {
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
    static CRYPTCAT_ATTR_AUTHENTICATED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_ATTR_UNAUTHENTICATED => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_ATTR_NAMEASCII => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_ATTR_NAMEOBJID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_ATTR_DATAASCII => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_ATTR_DATABASE64 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_ATTR_DATAREPLACE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_ATTR_NO_AUTO_COMPAT_ENTRY => 16777216
}
