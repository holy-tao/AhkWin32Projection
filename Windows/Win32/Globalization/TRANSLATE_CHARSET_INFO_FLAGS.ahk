#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class TRANSLATE_CHARSET_INFO_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static TCI_SRCCHARSET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TCI_SRCCODEPAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TCI_SRCFONTSIG => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TCI_SRCLOCALE => 4096
}
