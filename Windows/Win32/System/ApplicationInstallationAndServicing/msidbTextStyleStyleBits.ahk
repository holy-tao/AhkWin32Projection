#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbTextStyleStyleBits extends Win32Enum {

    /**
     * Native name: msidbTextStyleStyleBitsBold
     * @type {Integer (Int32)}
     */
    static Bold => 1

    /**
     * Native name: msidbTextStyleStyleBitsItalic
     * @type {Integer (Int32)}
     */
    static Italic => 2

    /**
     * Native name: msidbTextStyleStyleBitsUnderline
     * @type {Integer (Int32)}
     */
    static Underline => 4

    /**
     * Native name: msidbTextStyleStyleBitsStrike
     * @type {Integer (Int32)}
     */
    static Strike => 8
}
