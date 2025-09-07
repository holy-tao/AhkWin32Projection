#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HINSTANCE.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\WindowsAndMessaging\HICON.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The PROPSHEETPAGEW_V3 (Unicode) structure defines a page in a property sheet.
 * @remarks
 * Comctl32.dll version 6 and later are not redistributable. To use Comctl32.dll version 6 or later, specify the .dll file in a manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
 * @see https://learn.microsoft.com/windows/win32/api/prsht/ns-prsht-propsheetpagew_v3
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class PROPSHEETPAGEW_V3 extends Win32Struct
{
    static sizeof => 96

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
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(this.ptr + 8)
            return this.__hInstance
        }
    }

    /**
     * @type {PWSTR}
     */
    pszTemplate{
        get {
            if(!this.HasProp("__pszTemplate"))
                this.__pszTemplate := PWSTR(this.ptr + 16)
            return this.__pszTemplate
        }
    }

    /**
     * @type {Pointer<DLGTEMPLATE>}
     */
    pResource {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {HICON}
     */
    hIcon{
        get {
            if(!this.HasProp("__hIcon"))
                this.__hIcon := HICON(this.ptr + 24)
            return this.__hIcon
        }
    }

    /**
     * @type {PWSTR}
     */
    pszIcon{
        get {
            if(!this.HasProp("__pszIcon"))
                this.__pszIcon := PWSTR(this.ptr + 24)
            return this.__pszIcon
        }
    }

    /**
     * @type {PWSTR}
     */
    pszTitle{
        get {
            if(!this.HasProp("__pszTitle"))
                this.__pszTitle := PWSTR(this.ptr + 32)
            return this.__pszTitle
        }
    }

    /**
     * @type {Pointer<Ptr>}
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
     * @type {Pointer<Ptr>}
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
     * @type {PWSTR}
     */
    pszHeaderTitle{
        get {
            if(!this.HasProp("__pszHeaderTitle"))
                this.__pszHeaderTitle := PWSTR(this.ptr + 72)
            return this.__pszHeaderTitle
        }
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
     * @type {PWSTR}
     */
    pszHeaderSubTitle{
        get {
            if(!this.HasProp("__pszHeaderSubTitle"))
                this.__pszHeaderSubTitle := PWSTR(this.ptr + 80)
            return this.__pszHeaderSubTitle
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0</a> or later. An activation context handle. Set this member to the handle that is returned when you create the activation context with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createactctxa">CreateActCtx</a>. The system will activate this context before creating the dialog box. You do not need to use this member if you use a global manifest. See the Remarks.
     * @type {HANDLE}
     */
    hActCtx{
        get {
            if(!this.HasProp("__hActCtx"))
                this.__hActCtx := HANDLE(this.ptr + 88)
            return this.__hActCtx
        }
    }
}
