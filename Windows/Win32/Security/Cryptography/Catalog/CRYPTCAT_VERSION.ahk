#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */
class CRYPTCAT_VERSION extends Win32Enum {

    /**
     * Native name: CRYPTCAT_VERSION_1
     * @type {Integer (UInt32)}
     */
    static 1 => 256

    /**
     * Native name: CRYPTCAT_VERSION_2
     * @type {Integer (UInt32)}
     */
    static 2 => 512
}
