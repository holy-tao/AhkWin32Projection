#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the style of a font face (for example, normal or italic).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontstyle
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class FontStyle extends Win32Enum{

    /**
     * Represents a normal font style.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Represents an oblique font style.
     * @type {Integer (Int32)}
     */
    static Oblique => 1

    /**
     * Represents an italic font style.
     * @type {Integer (Int32)}
     */
    static Italic => 2
}
