#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Win32Handle.ahk

/**
 * Represents the number of the font used to format the text. Font numbers vary according to the fonts installed on your system. The number 0 represents the default font, which is typically Arial.
 * @remarks
 * To get a reference to the Font cell by name from another formula, or from a program using the **CellsU** property, use: 
 *   
 * ||Value |
 * |:-----|:-----|
 * | **Cell name:**  <br/> | Char.Font[  *i*  ]            where  *i*  = <1>, 2, 3... |
 *    
 * To get a reference to the Font cell by index from a program, use the **CellsSRC** property with the following arguments: 
 *   
 * ||Value |
 * |:-----|:-----|
 * | **Section index:**  <br/> |**visSectionCharacter** <br/> |
 * | **Row index:**  <br/> |**visRowCharacter** +  *i*            where  *i*  = 0, 1, 2... |
 * | **Cell index:**  <br/> |**visCharacterFont** <br/> |
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/font-cell-character-section
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Font extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
