#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class TXTHITRESULT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TXTHITRESULT_NOHIT => 0

    /**
     * @type {Integer (Int32)}
     */
    static TXTHITRESULT_TRANSPARENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static TXTHITRESULT_CLOSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static TXTHITRESULT_HIT => 3
}
