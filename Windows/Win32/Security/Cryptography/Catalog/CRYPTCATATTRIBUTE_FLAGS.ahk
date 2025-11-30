#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 * @version v4.0.30319
 */
class CRYPTCATATTRIBUTE_FLAGS extends Win32BitflagEnum{

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
