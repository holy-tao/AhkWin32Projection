#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a selection of text content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.textrange
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class TextRange extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The position that marks the beginning of the current selection, measured in Unicode characters from the beginning of the text.
     * @type {Integer}
     */
    StartIndex {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The length of the current selection, in Unicode characters.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
