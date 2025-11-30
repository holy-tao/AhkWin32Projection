#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class COMPARE_STRING_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static LINGUISTIC_IGNORECASE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LINGUISTIC_IGNOREDIACRITIC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NORM_IGNORECASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NORM_IGNOREKANATYPE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static NORM_IGNORENONSPACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NORM_IGNORESYMBOLS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NORM_IGNOREWIDTH => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static NORM_LINGUISTIC_CASING => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_DIGITSASNUMBERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_STRINGSORT => 4096
}
