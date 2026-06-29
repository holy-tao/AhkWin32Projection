#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Returned by the GetThemeMargins function to define the margins of windows that have visual styles applied.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ns-uxtheme-margins
 * @namespace Windows.Win32.UI.Controls
 */
export default struct MARGINS {
    #StructPack 4

    /**
     * Type: <b>int</b>
     * 
     * Width of the left border that retains its size.
     */
    cxLeftWidth : Int32

    /**
     * Type: <b>int</b>
     * 
     * Width of the right border that retains its size.
     */
    cxRightWidth : Int32

    /**
     * Type: <b>int</b>
     * 
     * Height of the top border that retains its size.
     */
    cyTopHeight : Int32

    /**
     * Type: <b>int</b>
     * 
     * Height of the bottom border that retains its size.
     */
    cyBottomHeight : Int32

}
