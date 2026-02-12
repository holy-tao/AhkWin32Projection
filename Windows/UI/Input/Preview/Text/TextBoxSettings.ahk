#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextBoxSettings extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static Private => 1

    /**
     * @type {Integer (UInt32)}
     */
    static Multiline => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VerticalWriting => 4
}
