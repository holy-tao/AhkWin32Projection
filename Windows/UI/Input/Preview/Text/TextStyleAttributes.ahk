#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextStyleAttributes extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TextColor => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BackgroundColor => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UnderlineColor => 4

    /**
     * @type {Integer (UInt32)}
     */
    static UnderlineType => 8
}
