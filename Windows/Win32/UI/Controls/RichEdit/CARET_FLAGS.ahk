#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
class CARET_FLAGS extends Win32Enum {

    /**
     * Native name: CARET_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: CARET_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 1

    /**
     * Native name: CARET_RTL
     * @type {Integer (Int32)}
     */
    static RTL => 2

    /**
     * Native name: CARET_ITALIC
     * @type {Integer (Int32)}
     */
    static ITALIC => 32

    /**
     * Native name: CARET_NULL
     * @type {Integer (Int32)}
     */
    static NULL => 64

    /**
     * Native name: CARET_ROTATE90
     * @type {Integer (Int32)}
     */
    static ROTATE90 => 128
}
