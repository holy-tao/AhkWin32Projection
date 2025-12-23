#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCPTrieType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCPTRIE_TYPE_ANY => -1

    /**
     * @type {Integer (Int32)}
     */
    static UCPTRIE_TYPE_FAST => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCPTRIE_TYPE_SMALL => 1
}
