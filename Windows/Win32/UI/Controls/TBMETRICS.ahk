#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the metrics of a toolbar that are used to shrink or expand toolbar items.
 * @remarks
 * The metrics specified by <b>TBMETRICS</b> structure are used to size the non-animating buttons on a toolbar. Button can shrink or expand so that all visible items fit on the window.
 * 
 * The padding values are used to create a blank area between the edge of the button and the button's image and/or text. Where and how much padding is actually applied depends on the type of the button and whether it has an image. The horizontal padding is applied to both the right and left of the button, and the vertical padding is applied to both the top and bottom of the button. Padding is only applied to buttons that have the <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-and-button-styles">TBSTYLE_AUTOSIZE</a> style.
 * 
 * Although values for <b>cxBarPad</b> and <b>cyBarPad</b> can be set and retrieved they currently have no effect and are not used.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tbmetrics
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TBMETRICS {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the <b>TBMETRICS</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Mask that determines the metric to retrieve. It can be any combination of the following:
     * 
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>TBMF_PAD</td>
     * <td>Retrieve the <b>cxPad</b> and <b>cyPad</b> values.</td>
     * </tr>
     * <tr>
     * <td>TBMF_BARPAD</td>
     * <td>Retrieve the <b>cxBarPad</b> and <b>cyBarPad</b> values.</td>
     * </tr>
     * <tr>
     * <td>TBMF_BUTTONSPACING</td>
     * <td>Retrieve the <b>cxButtonSpacing</b> and <b>cyButtonSpacing</b> values.</td>
     * </tr>
     * </table>
     */
    dwMask : UInt32

    /**
     * Type: <b>int</b>
     * 
     * Width of the padding inside the toolbar buttons, between the content and the edge of the button.
     */
    cxPad : Int32

    /**
     * Type: <b>int</b>
     * 
     * Height of the padding inside the toolbar buttons, between the content and the edge of the button.
     */
    cyPad : Int32

    /**
     * Type: <b>int</b>
     * 
     * Width of the toolbar. Not used.
     */
    cxBarPad : Int32

    /**
     * Type: <b>int</b>
     * 
     * Height of the toolbar. Not used.
     */
    cyBarPad : Int32

    /**
     * Type: <b>int</b>
     * 
     * Width of the space between toolbar buttons.
     */
    cxButtonSpacing : Int32

    /**
     * Type: <b>int</b>
     * 
     * Height of the space between toolbar buttons.
     */
    cyButtonSpacing : Int32

}
