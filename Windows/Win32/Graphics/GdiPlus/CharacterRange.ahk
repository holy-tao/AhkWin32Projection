#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A CharacterRange object specifies a range of character positions within a string.
 * @remarks
 * 
  * A character range is a range of character positions within a string of text. The area of the display that is occupied by a group of characters that are specified by the character range is the bounding region. A character range is set by 
  * 				<b>StringFormat::SetMeasurableCharacterRanges</b>. The number of ranges that are currently set can be determined by calling 
  * 				<b>StringFormat::GetMeasurableCharacterRangeCount</b>. This number is also the number of regions expected to be obtained by the 
  * 				<b>MeasureCharacterRanges</b> method.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplustypes/nl-gdiplustypes-characterrange
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class CharacterRange extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    First {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
