#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Identifies a sub-string of a source text string. Your app can use this structure to obtain the segment of your provided text that is identified by [AlternateWordForm](alternatewordform.md), [SelectableWordSegment](selectablewordsegment.md), [WordSegment](wordsegment.md), or [SemanticTextQuery](semantictextquery.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.data.text.textsegment
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class TextSegment extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The zero-based index of the start of the associated text segment.
     * @type {Integer}
     */
    StartPosition {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of characters in the associated text segment.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
