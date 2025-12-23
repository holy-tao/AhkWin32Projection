#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the style of a font face as normal, italic, or oblique.
 * @remarks
 * Three terms categorize the slant of a font: normal, italic, and oblique.
 *   
 * 
 * <table>
 * <tr>
 * <th>Font style</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>Normal</td>
 * <td>The characters in a normal, or roman, font are upright. 
 * </td>
 * </tr>
 * <tr>
 * <td>Italic 
 * </td>
 * <td>The characters in an italic font are truly slanted and appear as they were designed. 
 * </td>
 * </tr>
 * <tr>
 * <td>Oblique</td>
 * <td>The characters in an oblique font are artificially slanted.</td>
 * </tr>
 * </table>
 *  
 * 
 * For Oblique, the slant is achieved by performing a shear transformation on the characters from a normal font. When a true italic font is not available on a computer or printer, an oblique style can be generated from the normal font and used to simulate an italic font. 
 * 
 * The following illustration shows the normal, italic, and oblique font styles for the Palatino Linotype font. Notice how the italic font style has a more flowing and visually appealing appearance than the oblique font style, which is simply created by skewing the normal font style version of the text.
 * 
 * <img alt="Illustration of normal, italic, and oblique font styles" src="./images/FontStyle_for_Palatino.png"/>
 * 
 * <div class="alert"><b>Note</b>   Values other than the ones defined in the enumeration are considered to be invalid, and they are rejected by font API functions.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_style
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_STYLE extends Win32Enum{

    /**
     * Font style : Normal.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STYLE_NORMAL => 0

    /**
     * Font style : Oblique.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STYLE_OBLIQUE => 1

    /**
     * Font style : Italic.
     * @type {Integer (Int32)}
     */
    static DWRITE_FONT_STYLE_ITALIC => 2
}
