#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class BIDI_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_NULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_INT => 1

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_FLOAT => 2

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_BOOL => 3

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_STRING => 4

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_TEXT => 5

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_ENUM => 6

    /**
     * @type {Integer (Int32)}
     */
    static BIDI_BLOB => 7
}
