#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextBoxContentAttribute extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * @type {Integer (Int32)}
     */
    static Selection => 1

    /**
     * @type {Integer (Int32)}
     */
    static Text => 2

    /**
     * @type {Integer (Int32)}
     */
    static Property => 3

    /**
     * @type {Integer (Int32)}
     */
    static Layout => 4
}
