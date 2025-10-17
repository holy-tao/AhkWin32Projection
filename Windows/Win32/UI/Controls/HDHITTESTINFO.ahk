#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information about a hit test. This structure is used with the HDM_HITTEST message and it supersedes the HD_HITTESTINFO structure.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-hdhittestinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class HDHITTESTINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that contains the point to be hit test, in client coordinates.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(0, this)
            return this.__pt
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The variable that receives information about the results of a hit test. This member can be one or more of the values listed below. Two of these values can be combined, such as when the position is above and to the left of the client area.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_ABOVE"></a><a id="hht_above"></a><dl>
     * <dt><b>HHT_ABOVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point is above the header control's bounding rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_BELOW"></a><a id="hht_below"></a><dl>
     * <dt><b>HHT_BELOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point is below the header control's bounding rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_NOWHERE"></a><a id="hht_nowhere"></a><dl>
     * <dt><b>HHT_NOWHERE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point is inside the header control's bounding rectangle but is not over a header item.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_ONDIVIDER"></a><a id="hht_ondivider"></a><dl>
     * <dt><b>HHT_ONDIVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point is on the divider between two header items.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_ONDIVOPEN"></a><a id="hht_ondivopen"></a><dl>
     * <dt><b>HHT_ONDIVOPEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point is on the divider of an item that has a width of zero. Dragging the divider reveals the item instead of resizing the item to the left of the divider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_ONHEADER"></a><a id="hht_onheader"></a><dl>
     * <dt><b>HHT_ONHEADER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point is inside the header control's bounding rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_ONFILTER"></a><a id="hht_onfilter"></a><dl>
     * <dt><b>HHT_ONFILTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.80</a> The point is over the filter area.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_ONFILTERBUTTON"></a><a id="hht_onfilterbutton"></a><dl>
     * <dt><b>HHT_ONFILTERBUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.80</a> The point is on the filter button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_TOLEFT"></a><a id="hht_toleft"></a><dl>
     * <dt><b>HHT_TOLEFT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point is to the left of the header control's bounding rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_TORIGHT"></a><a id="hht_toright"></a><dl>
     * <dt><b>HHT_TORIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The point is to the right of the header control's bounding rectangle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_ONITEMSTATEICON"></a><a id="hht_onitemstateicon"></a><dl>
     * <dt><b>HHT_ONITEMSTATEICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.00</a> and <b>Windows Vista. </b> The point is within the state icon of the item.  If style <a href="https://docs.microsoft.com/windows/desktop/Controls/header-control-styles">HDS_CHECKBOXES</a> is specified, the point is within the checkbox of the item.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_ONDROPDOWN"></a><a id="hht_ondropdown"></a><dl>
     * <dt><b>HHT_ONDROPDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.00</a> and <b>Windows Vista.</b> The point is within the split button of the item.  The style HDF_SPLITBUTTON must be set on the item.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HHT_ONOVERFLOW"></a><a id="hht_onoverflow"></a><dl>
     * <dt><b>HHT_ONOVERFLOW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.00</a> and <b>Windows Vista.</b> The point is within the overflow button of the header control.  The style <a href="https://docs.microsoft.com/windows/desktop/Controls/header-control-styles">HDS_OVERFLOW</a> must be set on the header control.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * If the hit test is successful, contains the index of the item at the hit test point.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
