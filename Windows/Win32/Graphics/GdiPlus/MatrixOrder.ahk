#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class MatrixOrder extends Win32Enum {

    /**
     * Native name: MatrixOrderPrepend
     * @type {Integer (Int32)}
     */
    static Prepend => 0

    /**
     * Native name: MatrixOrderAppend
     * @type {Integer (Int32)}
     */
    static Append => 1
}
