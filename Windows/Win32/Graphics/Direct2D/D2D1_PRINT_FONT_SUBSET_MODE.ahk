#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines when font resources should be subset during printing.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_print_font_subset_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_PRINT_FONT_SUBSET_MODE extends Win32Enum{

    /**
     * Uses a heuristic strategy to decide when to subset fonts. 
     * 
     * > [!NOTE]
     * > If the print driver has requested archive-optimized content, then Direct2D will subset fonts once, for the entire document.
     * @type {Integer (Int32)}
     */
    static D2D1_PRINT_FONT_SUBSET_MODE_DEFAULT => 0

    /**
     * Subsets and embeds font resources in each page, then discards that font subset after the page is printed out.
     * @type {Integer (Int32)}
     */
    static D2D1_PRINT_FONT_SUBSET_MODE_EACHPAGE => 1

    /**
     * Sends out the original font resources without subsetting along with the page that first uses the font, and re-uses the font resources for later pages without resending them.
     * @type {Integer (Int32)}
     */
    static D2D1_PRINT_FONT_SUBSET_MODE_NONE => 2
}
