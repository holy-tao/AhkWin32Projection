#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains information that defines a band in a rebar control. (Unicode)
 * @remarks
 * The <b>cxMinChild</b>, <b>cyMinChild</b>, and <b>cx</b> members provide information on dimensions relative to the orientation of the control. That is, for a horizontal rebar control, <b>cxMinChild</b> and <b>cx</b> are horizontal measurements and <b>cyMinChild</b> is a vertical measurement. However, if the control uses the <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-styles">CCS_VERT</a> style, <b>cxMinChild</b> and <b>cx</b> are vertical measurements and <b>cyMinChild</b> is a horizontal measurement. 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The commctrl.h header defines REBARBANDINFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-rebarbandinfow
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class REBARBANDINFOW extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of this structure, in bytes. Your application must fill this member before sending any messages that use the address of this structure as a parameter.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flags that indicate which members of this structure are valid or must be filled. This value can be a combination of the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_BACKGROUND"></a><a id="rbbim_background"></a><dl>
     * <dt><b>RBBIM_BACKGROUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>hbmBack</b> member is valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_CHILD"></a><a id="rbbim_child"></a><dl>
     * <dt><b>RBBIM_CHILD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>hwndChild</b> member is valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_CHILDSIZE"></a><a id="rbbim_childsize"></a><dl>
     * <dt><b>RBBIM_CHILDSIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>cxMinChild</b>, <b>cyMinChild</b>, <b>cyChild</b>, <b>cyMaxChild</b>, and <b>cyIntegral</b> members are valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_COLORS"></a><a id="rbbim_colors"></a><dl>
     * <dt><b>RBBIM_COLORS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>clrFore</b> and <b>clrBack</b> members are valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_HEADERSIZE"></a><a id="rbbim_headersize"></a><dl>
     * <dt><b>RBBIM_HEADERSIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. The <b>cxHeader</b> member is valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_IDEALSIZE"></a><a id="rbbim_idealsize"></a><dl>
     * <dt><b>RBBIM_IDEALSIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. The <b>cxIdeal</b> member is valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_ID"></a><a id="rbbim_id"></a><dl>
     * <dt><b>RBBIM_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>wID</b> member is valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_IMAGE"></a><a id="rbbim_image"></a><dl>
     * <dt><b>RBBIM_IMAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>iImage</b> member is valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_LPARAM"></a><a id="rbbim_lparam"></a><dl>
     * <dt><b>RBBIM_LPARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. The <b>lParam</b> member is valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_SIZE"></a><a id="rbbim_size"></a><dl>
     * <dt><b>RBBIM_SIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>cx</b> member is valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_STYLE"></a><a id="rbbim_style"></a><dl>
     * <dt><b>RBBIM_STYLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>fStyle</b> member is valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_TEXT"></a><a id="rbbim_text"></a><dl>
     * <dt><b>RBBIM_TEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpText</b> member is valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_CHEVRONLOCATION"></a><a id="rbbim_chevronlocation"></a><dl>
     * <dt><b>RBBIM_CHEVRONLOCATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>rcChevronLocation</b> member is valid or must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBIM_CHEVRONSTATE"></a><a id="rbbim_chevronstate"></a><dl>
     * <dt><b>RBBIM_CHEVRONSTATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>uChevronState</b> member is valid or must be set.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flags that specify the band style. This value can be a combination of the following:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBS_BREAK"></a><a id="rbbs_break"></a><dl>
     * <dt><b>RBBS_BREAK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The band is on a new line.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBS_CHILDEDGE"></a><a id="rbbs_childedge"></a><dl>
     * <dt><b>RBBS_CHILDEDGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The band has an edge at the top and bottom of the child window.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBS_FIXEDBMP"></a><a id="rbbs_fixedbmp"></a><dl>
     * <dt><b>RBBS_FIXEDBMP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The background bitmap does not move when the band is resized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBS_FIXEDSIZE"></a><a id="rbbs_fixedsize"></a><dl>
     * <dt><b>RBBS_FIXEDSIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The band can't be sized. With this style, the sizing grip is not displayed on the band.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBS_GRIPPERALWAYS"></a><a id="rbbs_gripperalways"></a><dl>
     * <dt><b>RBBS_GRIPPERALWAYS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. The band will always have a sizing grip, even if it is the only band in the rebar.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBS_HIDDEN"></a><a id="rbbs_hidden"></a><dl>
     * <dt><b>RBBS_HIDDEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The band will not be visible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBS_NOGRIPPER"></a><a id="rbbs_nogripper"></a><dl>
     * <dt><b>RBBS_NOGRIPPER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. The band will never have a sizing grip, even if there is more than one band in the rebar.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBS_USECHEVRON"></a><a id="rbbs_usechevron"></a><dl>
     * <dt><b>RBBS_USECHEVRON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.80.</a> Show a chevron button if the band is smaller than <b>cxIdeal</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBS_VARIABLEHEIGHT"></a><a id="rbbs_variableheight"></a><dl>
     * <dt><b>RBBS_VARIABLEHEIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. The band can be resized by the rebar control; <b>cyIntegral</b> and <b>cyMaxChild</b> affect how the rebar will resize the band.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBS_NOVERT"></a><a id="rbbs_novert"></a><dl>
     * <dt><b>RBBS_NOVERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not show when vertical.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBS_HIDETITLE"></a><a id="rbbs_hidetitle"></a><dl>
     * <dt><b>RBBS_HIDETITLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keep band title hidden.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBBS_TOPALIGN"></a><a id="rbbs_topalign"></a><dl>
     * <dt><b>RBBS_TOPALIGN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Keep band in top row.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fStyle {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Band foreground colors.
     * @type {Integer}
     */
    clrFore {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Band background colors. If <b>hbmBack</b> specifies a background bitmap, these members are ignored. By default, the band will use the background color of the rebar control set with the <a href="https://docs.microsoft.com/windows/desktop/Controls/rb-setbkcolor">RB_SETBKCOLOR</a> message. If a background color is specified here, then this background color will be used instead.
     * @type {Integer}
     */
    clrBack {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * Pointer to a buffer that contains the display text for the band. If band information is being requested from the control and  RBBIM_TEXT is specified in <b>fMask</b>, this member must be initialized to the address of the buffer that will receive the text.
     * @type {Pointer<PWSTR>}
     */
    lpText {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the buffer at <b>lpText</b>, in bytes. If information is not being requested from the control, this member is ignored.
     * @type {Integer}
     */
    cch {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * Zero-based index of any image that should be displayed in the band. The image list is set using the <a href="https://docs.microsoft.com/windows/desktop/Controls/rb-setbarinfo">RB_SETBARINFO</a> message.
     * @type {Integer}
     */
    iImage {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Handle to the child window contained in the band, if any.
     * @type {Pointer<HWND>}
     */
    hwndChild {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Minimum width of the child window, in pixels. The band can't be sized smaller than this value.
     * @type {Integer}
     */
    cxMinChild {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Minimum height of the child window, in pixels. The band can't be sized smaller than this value.
     * @type {Integer}
     */
    cyMinChild {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Length of the band, in pixels.
     * @type {Integer}
     */
    cx {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * Handle to a bitmap that is used as the background for this band.
     * @type {Pointer<HBITMAP>}
     */
    hbmBack {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * UINT value that the control uses to identify this band for custom draw notification messages.
     * @type {Integer}
     */
    wID {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. Initial height of the band, in pixels. This member is ignored unless the RBBS_VARIABLEHEIGHT style is specified.
     * @type {Integer}
     */
    cyChild {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. Maximum height of the band, in pixels. This member is ignored unless the RBBS_VARIABLEHEIGHT style is specified.
     * @type {Integer}
     */
    cyMaxChild {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. Step value by which the band can grow or shrink, in pixels. If the band is resized, it will be resized in steps specified by this value. This member is ignored unless the  RBBS_VARIABLEHEIGHT style is specified.
     * @type {Integer}
     */
    cyIntegral {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. Ideal width of the band, in pixels. If the band is maximized to the ideal width (see <a href="https://docs.microsoft.com/windows/desktop/Controls/rb-maximizeband">RB_MAXIMIZEBAND</a>), the rebar control will attempt to make the band this width.
     * @type {Integer}
     */
    cxIdeal {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. Application-defined value.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 4.71</a>. Size of the band's header, in pixels. The band header is the area between the edge of the band and the edge of the child window. This is the area where band text and images are displayed, if they are specified. If this value is specified, it will override the normal header dimensions that the control calculates for the band.
     * @type {Integer}
     */
    cxHeader {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6</a>. Location of the chevron.
     * @type {RECT}
     */
    rcChevronLocation{
        get {
            if(!this.HasProp("__rcChevronLocation"))
                this.__rcChevronLocation := RECT(this.ptr + 112)
            return this.__rcChevronLocation
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6</a>. A combination of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-state-constants">Object State Constants</a>.
     * @type {Integer}
     */
    uChevronState {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 136
    }
}
