#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class FOLD_STRING_MAP_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: MAP_COMPOSITE
     * @type {Integer (UInt32)}
     */
    static COMPOSITE => 64

    /**
     * Native name: MAP_EXPAND_LIGATURES
     * @type {Integer (UInt32)}
     */
    static EXPAND_LIGATURES => 8192

    /**
     * Native name: MAP_FOLDCZONE
     * @type {Integer (UInt32)}
     */
    static FOLDCZONE => 16

    /**
     * Native name: MAP_FOLDDIGITS
     * @type {Integer (UInt32)}
     */
    static FOLDDIGITS => 128

    /**
     * Native name: MAP_PRECOMPOSED
     * @type {Integer (UInt32)}
     */
    static PRECOMPOSED => 32
}
