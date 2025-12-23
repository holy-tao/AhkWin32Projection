#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class USearchAttributeValue extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static USEARCH_DEFAULT => -1

    /**
     * @type {Integer (Int32)}
     */
    static USEARCH_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static USEARCH_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static USEARCH_STANDARD_ELEMENT_COMPARISON => 2

    /**
     * @type {Integer (Int32)}
     */
    static USEARCH_PATTERN_BASE_WEIGHT_IS_WILDCARD => 3

    /**
     * @type {Integer (Int32)}
     */
    static USEARCH_ANY_BASE_WEIGHT_IS_WILDCARD => 4
}
