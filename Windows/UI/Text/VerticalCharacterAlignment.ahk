#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the vertical position of a character relative to a bounding rectangle.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.verticalcharacteralignment
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class VerticalCharacterAlignment extends Win32Enum{

    /**
     * The character is positioned at the top edge of the bounding rectangle.
     * @type {Integer (Int32)}
     */
    static Top => 0

    /**
     * The character is positioned at the text baseline.
     * @type {Integer (Int32)}
     */
    static Baseline => 1

    /**
     * The character is positioned at the bottom edge of the bounding rectangle.
     * @type {Integer (Int32)}
     */
    static Bottom => 2
}
