#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class FOLD_STRING_MAP_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_COMPOSITE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_EXPAND_LIGATURES => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_FOLDCZONE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_FOLDDIGITS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAP_PRECOMPOSED => 32
}
