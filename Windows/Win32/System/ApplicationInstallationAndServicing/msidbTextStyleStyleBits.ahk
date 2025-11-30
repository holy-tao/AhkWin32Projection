#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msidbTextStyleStyleBits extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msidbTextStyleStyleBitsBold => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbTextStyleStyleBitsItalic => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbTextStyleStyleBitsUnderline => 4

    /**
     * @type {Integer (Int32)}
     */
    static msidbTextStyleStyleBitsStrike => 8
}
