#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether a line has rounded, square, or extended line caps.
 * @remarks
 * You can also set the value of this cell in the **Line** dialog box (on the **Home** tab, in the **Shape** group, click **Line**, point to **Arrows**, and then click **More Arrows**).
 *   
 * To get a reference to the LineCap cell by name from another formula, or from a program using the **CellsU** property, use: 
 *   
 * ||Value |
 * |:-----|:-----|
 * |**Cell name:**  <br/> |LineCap  <br/> |
 *    
 * To get a reference to the LineCap cell by index from a program, use the **CellsSRC** property with the following arguments: 
 *   
 * ||Value |
 * |:-----|:-----|
 * |**Section index:**  <br/> |**visSectionObject** <br/> |
 * |**Row index:**  <br/> |**visRowLine** <br/> |
 * |**Cell index:**  <br/> |**visLineEndCap** <br/> |
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/linecap-cell-line-format-section
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class LineCap extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LineCapFlat => 0

    /**
     * @type {Integer (Int32)}
     */
    static LineCapSquare => 1

    /**
     * @type {Integer (Int32)}
     */
    static LineCapRound => 2

    /**
     * @type {Integer (Int32)}
     */
    static LineCapTriangle => 3

    /**
     * @type {Integer (Int32)}
     */
    static LineCapNoAnchor => 16

    /**
     * @type {Integer (Int32)}
     */
    static LineCapSquareAnchor => 17

    /**
     * @type {Integer (Int32)}
     */
    static LineCapRoundAnchor => 18

    /**
     * @type {Integer (Int32)}
     */
    static LineCapDiamondAnchor => 19

    /**
     * @type {Integer (Int32)}
     */
    static LineCapArrowAnchor => 20

    /**
     * @type {Integer (Int32)}
     */
    static LineCapCustom => 255

    /**
     * @type {Integer (Int32)}
     */
    static LineCapAnchorMask => 240
}
