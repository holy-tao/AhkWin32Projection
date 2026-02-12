#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the horizontal position of a character relative to a bounding rectangle.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.horizontalcharacteralignment
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class HorizontalCharacterAlignment extends Win32Enum{

    /**
     * The character is at the left edge of the bounding rectangle.
     * @type {Integer (Int32)}
     */
    static Left => 0

    /**
     * The character is at the right edge of the bounding rectangle.
     * @type {Integer (Int32)}
     */
    static Right => 1

    /**
     * The character is at the center of the bounding rectangle.
     * @type {Integer (Int32)}
     */
    static Center => 2
}
