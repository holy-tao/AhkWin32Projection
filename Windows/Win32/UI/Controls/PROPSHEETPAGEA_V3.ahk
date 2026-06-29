#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\WindowsAndMessaging\DLGTEMPLATE.ahk" { DLGTEMPLATE }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }

/**
 * The PROPSHEETPAGEA_V3 (ANSI) structure defines a page in a property sheet.
 * @remarks
 * Comctl32.dll version 6 and later are not redistributable. To use Comctl32.dll version 6 or later, specify the .dll file in a manifest. For more information on manifests, see <a href="https://docs.microsoft.com/windows/desktop/Controls/cookbook-overview">Enabling Visual Styles</a>.
 * @see https://learn.microsoft.com/windows/win32/api/prsht/ns-prsht-propsheetpagea_v3
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PROPSHEETPAGEA_V3 {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    hInstance : HINSTANCE

    pszTemplate : PSTR

    hIcon : HICON

    pszTitle : PSTR

    pfnDlgProc : IntPtr

    lParam : LPARAM

    pfnCallback : IntPtr

    pcRefParent : IntPtr

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
     */
    pszHeaderTitle : PSTR

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
     */
    pszHeaderSubTitle : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 6.0</a> or later. An activation context handle. Set this member to the handle that is returned when you create the activation context with <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-createactctxa">CreateActCtx</a>. The system will activate this context before creating the dialog box. You do not need to use this member if you use a global manifest. See the Remarks.
     */
    hActCtx : HANDLE

    static __New() {
        DefineProp(this.Prototype, 'pResource', { type: DLGTEMPLATE.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'pszIcon', { type: PSTR, offset: 24 })
        this.DeleteProp("__New")
    }
}
