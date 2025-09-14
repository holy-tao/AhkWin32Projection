#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PROPSHEETPAGEA_V2 (ANSI) structure defines a page in a property sheet.
 * @remarks
 * Comctl32.dll version 6 and later are not redistributable. To use Comctl32.dll version 6 or later, specify the .dll file in a manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
 * @see https://learn.microsoft.com/windows/win32/api/prsht/ns-prsht-propsheetpagea_v2
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PROPSHEETPAGEA_V2 extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<HINSTANCE>}
     */
    hInstance {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PSTR>}
     */
    pszTemplate {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<DLGTEMPLATE>}
     */
    pResource {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<HICON>}
     */
    hIcon {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PSTR>}
     */
    pszIcon {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PSTR>}
     */
    pszTitle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<DLGPROC>}
     */
    pfnDlgProc {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<LPFNPSPCALLBACKA>}
     */
    pfnCallback {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    pcRefParent {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.80</a> or later. Title of the header area. To use this member under the Wizard97-style wizard, you must also do the following: 
     * 					
     *                     
     * 
     * <ul>
     * <li>Set the PSP_USEHEADERTITLE flag in the <b>dwFlags</b> member.</li>
     * <li>Set the PSH_WIZARD97 flag in the <b>dwFlags</b> member of the page's <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PROPSHEETHEADER</a> structure.</li>
     * <li>Make sure that the PSP_HIDEHEADER flag in the <b>dwFlags</b> member is not set.</li>
     * </ul>
     * @type {Pointer<PSTR>}
     */
    pszHeaderTitle {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.80</a>. Subtitle of the header area. To use this member, you must do the following:
     * 
     * 					
     * 
     * <ul>
     * <li>Set the PSP_USEHEADERSUBTITLE flag in the <b>dwFlags</b> member.</li>
     * <li>Set the PSH_WIZARD97 flag in the <b>dwFlags</b> member of the page's <a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PROPSHEETHEADER</a> structure.</li>
     * <li>Make sure that the PSP_HIDEHEADER flag in the <b>dwFlags</b> member is not set.</li>
     * </ul>
     * <div class="alert"><b>Note</b>  This member is ignored when using the Aero-style wizard (<a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PSH_AEROWIZARD</a>).</div>
     * <div> </div>
     * @type {Pointer<PSTR>}
     */
    pszHeaderSubTitle {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
