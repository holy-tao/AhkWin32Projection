#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class CREATE_FONT_PACKAGE_SUBSET_ENCODING extends Win32Enum{

    /**
     * @type {Integer (Int16)}
     */
    static TTFCFP_STD_MAC_CHAR_SET => 0

    /**
     * @type {Integer (Int16)}
     */
    static TTFCFP_SYMBOL_CHAR_SET => 0

    /**
     * @type {Integer (Int16)}
     */
    static TTFCFP_UNICODE_CHAR_SET => 1
}
