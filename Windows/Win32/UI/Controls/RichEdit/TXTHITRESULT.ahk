#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
class TXTHITRESULT extends Win32Enum {

    /**
     * Native name: TXTHITRESULT_NOHIT
     * @type {Integer (Int32)}
     */
    static NOHIT => 0

    /**
     * Native name: TXTHITRESULT_TRANSPARENT
     * @type {Integer (Int32)}
     */
    static TRANSPARENT => 1

    /**
     * Native name: TXTHITRESULT_CLOSE
     * @type {Integer (Int32)}
     */
    static CLOSE => 2

    /**
     * Native name: TXTHITRESULT_HIT
     * @type {Integer (Int32)}
     */
    static HIT => 3
}
