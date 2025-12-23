#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Defines the options for the DrawThemeTextEx function.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ns-uxtheme-dttopts
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class DTTOPTS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Size of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A combination of flags that specify whether certain values of the <b>DTTOPTS</b> structure have been specified, and how to interpret these values. This member can be a combination of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_TEXTCOLOR"></a><a id="dtt_textcolor"></a><dl>
     * <dt><b>DTT_TEXTCOLOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>crText</b> member value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_BORDERCOLOR"></a><a id="dtt_bordercolor"></a><dl>
     * <dt><b>DTT_BORDERCOLOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>crBorder</b> member value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_SHADOWCOLOR"></a><a id="dtt_shadowcolor"></a><dl>
     * <dt><b>DTT_SHADOWCOLOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>crShadow</b> member value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_SHADOWTYPE"></a><a id="dtt_shadowtype"></a><dl>
     * <dt><b>DTT_SHADOWTYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>iTextShadowType</b> member value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_SHADOWOFFSET"></a><a id="dtt_shadowoffset"></a><dl>
     * <dt><b>DTT_SHADOWOFFSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>ptShadowOffset</b> member value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_BORDERSIZE"></a><a id="dtt_bordersize"></a><dl>
     * <dt><b>DTT_BORDERSIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>iBorderSize</b> member value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_FONTPROP"></a><a id="dtt_fontprop"></a><dl>
     * <dt><b>DTT_FONTPROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>iFontPropId</b> member value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_COLORPROP"></a><a id="dtt_colorprop"></a><dl>
     * <dt><b>DTT_COLORPROP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>iColorPropId</b> member value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_STATEID"></a><a id="dtt_stateid"></a><dl>
     * <dt><b>DTT_STATEID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>iStateId</b> member value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_CALCRECT"></a><a id="dtt_calcrect"></a><dl>
     * <dt><b>DTT_CALCRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pRect</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-drawthemetextex">DrawThemeTextEx</a> function that uses this structure will be used as both an in and an out parameter. After the function returns, the <i>pRect</i> parameter will contain the rectangle that corresponds to the region calculated to be drawn.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_APPLYOVERLAY"></a><a id="dtt_applyoverlay"></a><dl>
     * <dt><b>DTT_APPLYOVERLAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>fApplyOverlay</b> member value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_GLOWSIZE"></a><a id="dtt_glowsize"></a><dl>
     * <dt><b>DTT_GLOWSIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>iGlowSize</b> member value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_CALLBACK"></a><a id="dtt_callback"></a><dl>
     * <dt><b>DTT_CALLBACK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>pfnDrawTextCallback</b> member value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_COMPOSITED"></a><a id="dtt_composited"></a><dl>
     * <dt><b>DTT_COMPOSITED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Draws text with antialiased alpha. Use of this flag requires a top-down DIB section. This flag works only if the HDC passed to function <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-drawthemetextex">DrawThemeTextEx</a> has a top-down DIB section currently selected in it. For more information, see <a href="https://docs.microsoft.com/windows/desktop/gdi/device-independent-bitmaps">Device-Independent Bitmaps</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DTT_VALIDBITS"></a><a id="dtt_validbits"></a><dl>
     * <dt><b>DTT_VALIDBITS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DTT_TEXTCOLOR |  DTT_BORDERCOLOR | DTT_SHADOWCOLOR | DTT_SHADOWTYPE | 
     *               DTT_SHADOWOFFSET | DTT_BORDERSIZE | DTT_FONTPROP | DTT_COLORPROP | DTT_STATEID | DTT_CALCRECT |  DTT_APPLYOVERLAY | DTT_GLOWSIZE | DTT_COMPOSITED.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the text that will be drawn.
     * @type {COLORREF}
     */
    crText {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the outline that will be drawn around the text.
     * @type {COLORREF}
     */
    crBorder {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the shadow that will be drawn behind the text.
     * @type {COLORREF}
     */
    crShadow {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * @type {Integer}
     */
    iTextShadowType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * Specifies the amount of offset, in logical coordinates, between the shadow and the text.
     * @type {POINT}
     */
    ptShadowOffset{
        get {
            if(!this.HasProp("__ptShadowOffset"))
                this.__ptShadowOffset := POINT(24, this)
            return this.__ptShadowOffset
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * Specifies the radius of the outline that will be drawn around the text.
     * @type {Integer}
     */
    iBorderSize {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * Specifies an alternate font property to use when drawing text. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-getthemesysfont">GetThemeSysFont</a>.
     * @type {Integer}
     */
    iFontPropId {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: <b>int</b>
     * 
     * Specifies an alternate color property to use when drawing text. If this value is valid and the corresponding flag is set in <b>dwFlags</b>, this value will override the value of <b>crText</b>. See the values listed in <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsyscolor">GetSysColor</a> for the <i>nIndex</i> parameter.
     * @type {Integer}
     */
    iColorPropId {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>int</b>
     * 
     * Specifies an alternate state to use. This member is not used by <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-drawthemetextex">DrawThemeTextEx</a>.
     * @type {Integer}
     */
    iStateId {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If <b>TRUE</b>, text will be drawn on top of the shadow and outline effects. If <b>FALSE</b>, just the shadow and outline effects will be drawn.
     * @type {BOOL}
     */
    fApplyOverlay {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: <b>int</b>
     * 
     * Specifies the size of a glow that will be drawn on the background prior to any text being drawn.
     * @type {Integer}
     */
    iGlowSize {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * Type: <b>DTT_CALLBACK_PROC</b>
     * 
     * Pointer to callback function for <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-drawthemetextex">DrawThemeTextEx</a>.
     * @type {Pointer<DTT_CALLBACK_PROC>}
     */
    pfnDrawTextCallback {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Parameter for callback back function specified by <b>pfnDrawTextCallback</b>.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
