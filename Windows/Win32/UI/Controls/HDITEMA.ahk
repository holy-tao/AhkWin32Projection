#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk

/**
 * Contains information about an item in a header control. This structure supersedes the HD_ITEM structure. (ANSI)
 * @remarks
 * <div class="alert"><b>Note</b>  Comctl32.dll version 6 is not redistributable but it is included in Windows. To use Comctl32.dll version 6, specify it in a manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.</div>
  * <div> </div>
  * 
  * 
  * 
  * > [!NOTE]
  * > The commctrl.h header defines HDITEM as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-hditema
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class HDITEMA extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    mask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The width or height of the item.
     * @type {Integer}
     */
    cxy {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * A pointer to an item string. If the text is being retrieved from the control, this member must be initialized to point to a character buffer. If this member is set to LPSTR_TEXTCALLBACK, the control will request text information for this item by sending an <a href="https://docs.microsoft.com/windows/desktop/Controls/hdn-getdispinfo">HDN_GETDISPINFO</a> notification code. Note that although the header control allows a string of any length to be stored as item text, only the first 260 <b>TCHAR</b><b>s</b> are displayed.
     * @type {PSTR}
     */
    pszText{
        get {
            if(!this.HasProp("__pszText"))
                this.__pszText := PSTR(this.ptr + 8)
            return this.__pszText
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the item bitmap.
     * @type {HBITMAP}
     */
    hbm{
        get {
            if(!this.HasProp("__hbm"))
                this.__hbm := HBITMAP(this.ptr + 16)
            return this.__hbm
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * The length of the item string, in <b>TCHAR</b><b>s</b>. If the text is being retrieved from the control, this member must contain the number of <b>TCHAR</b><b>s</b> at the address specified by <b>pszText</b>.
     * @type {Integer}
     */
    cchTextMax {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Flags that specify the item's format.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Text_Justification_"></a><a id="text_justification_"></a><a id="TEXT_JUSTIFICATION_"></a><dl>
     * <dt><b>Text Justification:</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set one of the following flags to specify text justification:
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_CENTER"></a><a id="hdf_center"></a><dl>
     * <dt><b>HDF_CENTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item's contents are centered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_LEFT"></a><a id="hdf_left"></a><dl>
     * <dt><b>HDF_LEFT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item's contents are left-aligned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_RIGHT"></a><a id="hdf_right"></a><dl>
     * <dt><b>HDF_RIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item's contents are right-aligned.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Display_"></a><a id="display_"></a><a id="DISPLAY_"></a><dl>
     * <dt><b>Display:</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set one of the following flags to control the display:
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_BITMAP"></a><a id="hdf_bitmap"></a><dl>
     * <dt><b>HDF_BITMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item displays a bitmap.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_BITMAP_ON_RIGHT"></a><a id="hdf_bitmap_on_right"></a><dl>
     * <dt><b>HDF_BITMAP_ON_RIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The bitmap appears to the right of text.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_OWNERDRAW"></a><a id="hdf_ownerdraw"></a><dl>
     * <dt><b>HDF_OWNERDRAW</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header control's owner draws the item.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_STRING"></a><a id="hdf_string"></a><dl>
     * <dt><b>HDF_STRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item displays a string.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Combining_Flags_"></a><a id="combining_flags_"></a><a id="COMBINING_FLAGS_"></a><dl>
     * <dt><b>Combining Flags:</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The preceding value can be combined with:
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_IMAGE"></a><a id="hdf_image"></a><dl>
     * <dt><b>HDF_IMAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display an image from an image list. Specify the image list by sending an <a href="https://docs.microsoft.com/windows/desktop/Controls/hdm-setimagelist">HDM_SETIMAGELIST</a> message. Specify the index of the image in the <b>iImage</b> member of this structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_JUSTIFYMASK"></a><a id="hdf_justifymask"></a><dl>
     * <dt><b>HDF_JUSTIFYMASK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Isolate the bits corresponding to the three justification flags listed in the preceding table.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_RTLREADING"></a><a id="hdf_rtlreading"></a><dl>
     * <dt><b>HDF_RTLREADING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Typically, windows displays text left-to-right (LTR). Windows can be <i>mirrored</i> to display languages such as Hebrew or Arabic that read right-to-left (RTL). Usually, header text is read in the same direction as the text in its parent window. If HDF_RTLREADING is set, header text will read in the opposite direction from the text in the parent window.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_SORTDOWN"></a><a id="hdf_sortdown"></a><dl>
     * <dt><b>HDF_SORTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.00 and later</a>. Draws a down-arrow on this item. This is typically used to indicate that information in the current window is sorted on this column in descending order. This flag cannot be combined with HDF_IMAGE or HDF_BITMAP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_SORTUP"></a><a id="hdf_sortup"></a><dl>
     * <dt><b>HDF_SORTUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.00 and later</a>. Draws an up-arrow on this item. This is typically used to indicate that information in the current window is sorted on this column in ascending order. This flag cannot be combined with HDF_IMAGE or HDF_BITMAP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_CHECKBOX"></a><a id="hdf_checkbox"></a><dl>
     * <dt><b>HDF_CHECKBOX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.00 and later</a>. The item displays a checkbox.  The flag is only valid when the <a href="https://docs.microsoft.com/windows/desktop/Controls/header-control-styles">HDS_CHECKBOXES</a> style is first set on the header control. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_CHECKED"></a><a id="hdf_checked"></a><dl>
     * <dt><b>HDF_CHECKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.00 and later</a>. The item displays a checked checkbox. The flag is only valid when HDF_CHECKBOX is also set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_FIXEDWIDTH"></a><a id="hdf_fixedwidth"></a><dl>
     * <dt><b>HDF_FIXEDWIDTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.00 and later</a>. The width of the item cannot be modified by a user action to resize it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDF_SPLITBUTTON"></a><a id="hdf_splitbutton"></a><dl>
     * <dt><b>HDF_SPLITBUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.00 and later</a>.  The item displays a split button.  The HDN_DROPDOWN notification is sent when the split button is clicked.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fmt {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined item data.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * The zero-based index of an image within the image list. The specified image will be displayed in the header item in addition to any image specified in the <b>hbm</b>  field. If <b>iImage</b> is set to I_IMAGECALLBACK, the control requests text information for this item by using an <a href="https://docs.microsoft.com/windows/desktop/Controls/hdn-getdispinfo">HDN_GETDISPINFO</a> notification code. To clear the image, set this value to I_IMAGENONE.
     * @type {Integer}
     */
    iImage {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>int</b>
     * 
     * The order in which the item appears within the header control, from left to right. That is, the value for the far left item is 0. The value for the next item to the right is 1, and so on.
     * @type {Integer}
     */
    iOrder {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The type of filter specified by <b>pvFilter</b>. The possible types include: 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDFT_ISSTRING"></a><a id="hdft_isstring"></a><dl>
     * <dt><b>HDFT_ISSTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * String data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDFT_ISNUMBER"></a><a id="hdft_isnumber"></a><dl>
     * <dt><b>HDFT_ISNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Numerical data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDFT_HASNOVALUE"></a><a id="hdft_hasnovalue"></a><dl>
     * <dt><b>HDFT_HASNOVALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore <b>pvFilter</b>.
     * 					
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HDFT_ISDATE"></a><a id="hdft_isdate"></a><dl>
     * <dt><b>HDFT_ISDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.00 and later</a>. Date data. The <b>pvFilter</b> member is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    type {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>void*</b>
     * 
     * The address of an application-defined data item. The data filter type is determined by setting the flag value of the  member. Use the HDFT_ISSTRING flag to indicate a string and HDFT_ISNUMBER to indicate an integer. When the HDFT_ISSTRING flag is used <b>pvFilter</b> is a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-hd_textfiltera">HDTEXTFILTER</a> structure.
     * @type {Pointer<Void>}
     */
    pvFilter {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The state. The only valid, supported value for this member is the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>HDIS_FOCUSED</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The item has keyboard focus.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    state {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
