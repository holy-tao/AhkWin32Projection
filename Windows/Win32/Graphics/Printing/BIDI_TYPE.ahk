#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class BIDI_TYPE extends Win32Enum {

    /**
     * Native name: BIDI_NULL
     * @type {Integer (Int32)}
     */
    static NULL => 0

    /**
     * Native name: BIDI_INT
     * @type {Integer (Int32)}
     */
    static INT => 1

    /**
     * Native name: BIDI_FLOAT
     * @type {Integer (Int32)}
     */
    static FLOAT => 2

    /**
     * Native name: BIDI_BOOL
     * @type {Integer (Int32)}
     */
    static BOOL => 3

    /**
     * Native name: BIDI_STRING
     * @type {Integer (Int32)}
     */
    static STRING => 4

    /**
     * Native name: BIDI_TEXT
     * @type {Integer (Int32)}
     */
    static TEXT => 5

    /**
     * Native name: BIDI_ENUM
     * @type {Integer (Int32)}
     */
    static ENUM => 6

    /**
     * Native name: BIDI_BLOB
     * @type {Integer (Int32)}
     */
    static BLOB => 7
}
