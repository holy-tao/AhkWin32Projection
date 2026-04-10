#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UCPTrieValueWidth extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UCPTRIE_VALUE_BITS_ANY => -1

    /**
     * @type {Integer (Int32)}
     */
    static UCPTRIE_VALUE_BITS_16 => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCPTRIE_VALUE_BITS_32 => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCPTRIE_VALUE_BITS_8 => 2
}
