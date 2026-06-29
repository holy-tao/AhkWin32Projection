#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Used to specify and set applet configuration in IImePad.
 * @see https://learn.microsoft.com/windows/win32/api/imepad/ns-imepad-imeappletcfg
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEAPPLETCFG {
    #StructPack 8

    /**
     * Combination of <b>IPACFG_*</b> flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPACFG_NONE"></a><a id="ipacfg_none"></a><dl>
     * <dt><b>IPACFG_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPACFG_PROPERTY"></a><a id="ipacfg_property"></a><dl>
     * <dt><b>IPACFG_PROPERTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The applet has a property Dialog. If this flag is set, <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nn-imepad-iimepad">IImePad</a> calls <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nf-imepad-iimepadapplet-notify">IImePadApplet::Notify</a> with <b>IMEPN_CFG</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPACFG_HELP"></a><a id="ipacfg_help"></a><dl>
     * <dt><b>IPACFG_HELP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The applet has help. If this flag is set, <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nn-imepad-iimepad">IImePad</a> calls <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nf-imepad-iimepadapplet-notify">IImePadApplet::Notify</a> with <b>IMEPN_HELP</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPACFG_TITLE"></a><a id="ipacfg_title"></a><dl>
     * <dt><b>IPACFG_TITLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>wchTitle</b> is set. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPACFG_TITLEFONTFACE"></a><a id="ipacfg_titlefontface"></a><dl>
     * <dt><b>IPACFG_TITLEFONTFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>wchTitleFontFace</b> and <b>dwCharSet</b> are set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPACFG_CATEGORY"></a><a id="ipacfg_category"></a><dl>
     * <dt><b>IPACFG_CATEGORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>iCategory</b>  is set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPACFG_LANG"></a><a id="ipacfg_lang"></a><dl>
     * <dt><b>IPACFG_LANG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>LangID</b> is set.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwConfig : UInt32

    /**
     * The applet's title, in Unicode.
     */
    wchTitle : WCHAR[64]

    /**
     * The applet title's FontFace name.
     */
    wchTitleFontFace : WCHAR[32]

    /**
     * The applet font's character set.
     */
    dwCharSet : UInt32

    /**
     * Not used.
     */
    iCategory : Int32

    /**
     * The icon handle for the ImePad applet's menu.
     */
    hIcon : HICON

    /**
     * The applet's language ID.
     */
    langID : UInt16

    /**
     * Not used.
     */
    dummy : UInt16

    /**
     * Reserved.
     */
    lReserved1 : LPARAM

}
