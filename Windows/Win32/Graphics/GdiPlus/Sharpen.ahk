#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\Effect.ahk

/**
 * Sharpens a bitmap image. The default value is 0%. Sharpening an image focuses it by increasing the contrast of adjacent pixels.
 * @remarks
 * To get a reference to the Sharpen cell by name from another formula, or from a program using the **CellsU** property, use: 
 *   
 * ||Value |
 * |:-----|:-----|
 * | **Cell name:**  <br/> | Sharpen  <br/> |
 *    
 * To get a reference to the Sharpen cell by index from a program, use the **CellsSRC** property with the following arguments: 
 *   
 * ||Value |
 * |:-----|:-----|
 * | **Section index:**  <br/> |**visSectionObject** <br/> |
 * | **Row index:**  <br/> |**visRowImage** <br/> |
 * | **Cell index:**  <br/> |**visImageSharpen** <br/> |
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/sharpen-cell-image-properties-section
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Sharpen extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Effect}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := Effect(0, this)
            return this.__Base
        }
    }
}
