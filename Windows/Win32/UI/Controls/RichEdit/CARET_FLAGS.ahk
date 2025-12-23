#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class CARET_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CARET_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CARET_CUSTOM => 1

    /**
     * @type {Integer (Int32)}
     */
    static CARET_RTL => 2

    /**
     * @type {Integer (Int32)}
     */
    static CARET_ITALIC => 32

    /**
     * @type {Integer (Int32)}
     */
    static CARET_NULL => 64

    /**
     * @type {Integer (Int32)}
     */
    static CARET_ROTATE90 => 128
}
