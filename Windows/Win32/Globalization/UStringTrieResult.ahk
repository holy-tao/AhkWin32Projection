#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UStringTrieResult extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static USTRINGTRIE_NO_MATCH => 0

    /**
     * @type {Integer (Int32)}
     */
    static USTRINGTRIE_NO_VALUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static USTRINGTRIE_FINAL_VALUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static USTRINGTRIE_INTERMEDIATE_VALUE => 3
}
