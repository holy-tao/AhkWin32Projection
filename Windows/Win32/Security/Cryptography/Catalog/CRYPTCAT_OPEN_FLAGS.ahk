#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */
class CRYPTCAT_OPEN_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: CRYPTCAT_OPEN_ALWAYS
     * @type {Integer (UInt32)}
     */
    static ALWAYS => 2

    /**
     * Native name: CRYPTCAT_OPEN_CREATENEW
     * @type {Integer (UInt32)}
     */
    static CREATENEW => 1

    /**
     * Native name: CRYPTCAT_OPEN_EXISTING
     * @type {Integer (UInt32)}
     */
    static EXISTING => 4

    /**
     * Native name: CRYPTCAT_OPEN_EXCLUDE_PAGE_HASHES
     * @type {Integer (UInt32)}
     */
    static EXCLUDE_PAGE_HASHES => 65536

    /**
     * Native name: CRYPTCAT_OPEN_INCLUDE_PAGE_HASHES
     * @type {Integer (UInt32)}
     */
    static INCLUDE_PAGE_HASHES => 131072

    /**
     * Native name: CRYPTCAT_OPEN_VERIFYSIGHASH
     * @type {Integer (UInt32)}
     */
    static VERIFYSIGHASH => 268435456

    /**
     * Native name: CRYPTCAT_OPEN_NO_CONTENT_HCRYPTMSG
     * @type {Integer (UInt32)}
     */
    static NO_CONTENT_HCRYPTMSG => 536870912

    /**
     * Native name: CRYPTCAT_OPEN_SORTED
     * @type {Integer (UInt32)}
     */
    static SORTED => 1073741824

    /**
     * Native name: CRYPTCAT_OPEN_FLAGS_MASK
     * @type {Integer (UInt32)}
     */
    static MASK => 4294901760
}
