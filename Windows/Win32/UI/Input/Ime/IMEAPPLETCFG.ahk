#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used to specify and set applet configuration in IImePad.
 * @see https://learn.microsoft.com/windows/win32/api/imepad/ns-imepad-imeappletcfg
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IMEAPPLETCFG extends Win32Struct
{
    static sizeof => 232

    static packingSize => 8

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
     * @type {Integer}
     */
    dwConfig {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The applet's title, in Unicode.
     * @type {String}
     */
    wchTitle {
        get => StrGet(this.ptr + 4, 63, "UTF-16")
        set => StrPut(value, this.ptr + 4, 63, "UTF-16")
    }

    /**
     * The applet title's FontFace name.
     * @type {String}
     */
    wchTitleFontFace {
        get => StrGet(this.ptr + 132, 31, "UTF-16")
        set => StrPut(value, this.ptr + 132, 31, "UTF-16")
    }

    /**
     * The applet font's character set.
     * @type {Integer}
     */
    dwCharSet {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    iCategory {
        get => NumGet(this, 200, "int")
        set => NumPut("int", value, this, 200)
    }

    /**
     * The icon handle for the ImePad applet's menu.
     * @type {Pointer<Void>}
     */
    hIcon {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * The applet's language ID.
     * @type {Integer}
     */
    langID {
        get => NumGet(this, 216, "ushort")
        set => NumPut("ushort", value, this, 216)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    dummy {
        get => NumGet(this, 218, "ushort")
        set => NumPut("ushort", value, this, 218)
    }

    /**
     * Reserved.
     * @type {Pointer}
     */
    lReserved1 {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }
}
