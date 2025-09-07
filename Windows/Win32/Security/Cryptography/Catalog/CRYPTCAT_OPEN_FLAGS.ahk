#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 * @version v4.0.30319
 */
class CRYPTCAT_OPEN_FLAGS{

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
