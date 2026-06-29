#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DTTOPTS_FLAGS.ahk" { DTTOPTS_FLAGS }

/**
 * Defines the options for the DrawThemeTextEx function.
 * @see https://learn.microsoft.com/windows/win32/api/uxtheme/ns-uxtheme-dttopts
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DTTOPTS {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Size of the structure.
     */
    dwSize : UInt32

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
     */
    dwFlags : DTTOPTS_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the text that will be drawn.
     */
    crText : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the outline that will be drawn around the text.
     */
    crBorder : COLORREF

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">COLORREF</a></b>
     * 
     * Specifies the color of the shadow that will be drawn behind the text.
     */
    crShadow : COLORREF

    /**
     * Type: <b>int</b>
     */
    iTextShadowType : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * Specifies the amount of offset, in logical coordinates, between the shadow and the text.
     */
    ptShadowOffset : POINT

    /**
     * Type: <b>int</b>
     * 
     * Specifies the radius of the outline that will be drawn around the text.
     */
    iBorderSize : Int32

    /**
     * Type: <b>int</b>
     * 
     * Specifies an alternate font property to use when drawing text. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-getthemesysfont">GetThemeSysFont</a>.
     */
    iFontPropId : Int32

    /**
     * Type: <b>int</b>
     * 
     * Specifies an alternate color property to use when drawing text. If this value is valid and the corresponding flag is set in <b>dwFlags</b>, this value will override the value of <b>crText</b>. See the values listed in <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsyscolor">GetSysColor</a> for the <i>nIndex</i> parameter.
     */
    iColorPropId : Int32

    /**
     * Type: <b>int</b>
     * 
     * Specifies an alternate state to use. This member is not used by <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-drawthemetextex">DrawThemeTextEx</a>.
     */
    iStateId : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If <b>TRUE</b>, text will be drawn on top of the shadow and outline effects. If <b>FALSE</b>, just the shadow and outline effects will be drawn.
     */
    fApplyOverlay : BOOL

    /**
     * Type: <b>int</b>
     * 
     * Specifies the size of a glow that will be drawn on the background prior to any text being drawn.
     */
    iGlowSize : Int32

    /**
     * Type: <b>DTT_CALLBACK_PROC</b>
     * 
     * Pointer to callback function for <a href="https://docs.microsoft.com/windows/desktop/api/uxtheme/nf-uxtheme-drawthemetextex">DrawThemeTextEx</a>.
     */
    pfnDrawTextCallback : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Parameter for callback back function specified by <b>pfnDrawTextCallback</b>.
     */
    lParam : LPARAM

}
