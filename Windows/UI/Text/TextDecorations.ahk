#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the decorations applied to text.
 * @remarks
 * These enumeration values are used by the **TextDecorations** property of various text controls. For more info and examples, see the property documentation.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.textdecorations
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class TextDecorations extends Win32BitflagEnum{

    /**
     * No text decorations are applied.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Underline is applied to the text.
     * @type {Integer (UInt32)}
     */
    static Underline => 1

    /**
     * Strikethrough is applied to the text.
     * @type {Integer (UInt32)}
     */
    static Strikethrough => 2
}
