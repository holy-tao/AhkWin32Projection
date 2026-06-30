#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 */
class CRYPTCAT_VERSION extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_VERSION_1 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPTCAT_VERSION_2 => 512
}
