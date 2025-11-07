#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the metrics of a toolbar that are used to shrink or expand toolbar items.
 * @remarks
 * 
 * The metrics specified by <b>TBMETRICS</b> structure are used to size the non-animating buttons on a toolbar. Button can shrink or expand so that all visible items fit on the window.
 * 
 * The padding values are used to create a blank area between the edge of the button and the button's image and/or text. Where and how much padding is actually applied depends on the type of the button and whether it has an image. The horizontal padding is applied to both the right and left of the button, and the vertical padding is applied to both the top and bottom of the button. Padding is only applied to buttons that have the <a href="https://docs.microsoft.com/windows/desktop/Controls/toolbar-control-and-button-styles">TBSTYLE_AUTOSIZE</a> style.
 * 
 * Although values for <b>cxBarPad</b> and <b>cyBarPad</b> can be set and retrieved they currently have no effect and are not used.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-tbmetrics
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TBMETRICS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the <b>TBMETRICS</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * Width of the padding inside the toolbar buttons, between the content and the edge of the button.
     * @type {Integer}
     */
    cxPad {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * Height of the padding inside the toolbar buttons, between the content and the edge of the button.
     * @type {Integer}
     */
    cyPad {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>int</b>
     * 
     * Width of the toolbar. Not used.
     * @type {Integer}
     */
    cxBarPad {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * Height of the toolbar. Not used.
     * @type {Integer}
     */
    cyBarPad {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>int</b>
     * 
     * Width of the space between toolbar buttons.
     * @type {Integer}
     */
    cxButtonSpacing {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Height of the space between toolbar buttons.
     * @type {Integer}
     */
    cyButtonSpacing {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 32
    }
}
