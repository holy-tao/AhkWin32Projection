#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROPSHEETPAGEW.ahk" { PROPSHEETPAGEW }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import ".\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Graphics\Gdi\HPALETTE.ahk" { HPALETTE }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }

/**
 * The PROPSHEETHEADERW_V2 (Unicode) structure defines the frame and pages of a property sheet.
 * @remarks
 * If the user chooses a setting such as Large Fonts, which enlarges the dialog box, the watermark that is painted on the start and finish pages will be enlarged as well. The size and position of the original bitmap will remain the same. The additional area will be filled with the color of the pixel in the upper-left corner of the bitmap.
 * 
 * Note that several members of this structure are only supported for Comctl32.dll versions 4.71 and later. You can enable these members by including one of the following in your header. 
 * 
 *                 
 * 
 * <c>#define _WIN32_IE 0x0400 // For version 4.71</c>
 * 
 * or
 *                 
 * 
 * <c>#define _WIN32_IE 0x0500 // For version 5.80</c>
 * 
 * However, you must initialize the structure with its size. If you use the size of the currently defined structure, the application may not run with the earlier versions of Comctl32.dll, which expect a smaller structure. This includes all systems with Windows 95 or Microsoft Windows NT 4.0 that do not have Internet Explorer 4.0 or later installed. You can run your application on pre-4.71 versions of Comctl32.dll by defining the appropriate <a href="https://docs.microsoft.com/windows/desktop/Controls/common-controls-intro">version number</a>. However, this may cause problems if your application also needs to run on systems with more recent versions.
 * 
 * You can remain compatible with all Comctl32.dll versions by using the current header files and setting the size of the <b>PROPSHEETHEADER</b> structure appropriately. Before you initialize the structure, use the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nc-shlwapi-dllgetversionproc">DllGetVersion</a> function to determine which Comctl32.dll version is installed on the system. If it is version 4.71 or greater, use
 * 
 * <c>psh.dwSize = sizeof(PROPSHEETHEADER);</c>
 * 
 * to initialize the <b>dwSize</b> member. For earlier versions, the size of the pre-4.71 structure is given by the PROPSHEETHEADER_V1_SIZE constant. Use
 * 
 * <c>psh.dwSize = PROPSHEETHEADER_V1_SIZE;</c>
 * 
 * The PSH_WIZARD, PSH_WIZARD97, and PSH_WIZARD_LITE styles are mutually incompatible. Only one of these style flags should be set. PSH_AEROWIZARD should be combined with PSH_WIZARD.
 * @see https://learn.microsoft.com/windows/win32/api/prsht/ns-prsht-propsheetheaderw_v2
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PROPSHEETHEADERW_V2 {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    hwndParent : HWND

    hInstance : HINSTANCE

    hIcon : HICON

    pszCaption : PWSTR

    nPages : UInt32

    nStartPage : UInt32

    ppsp : PROPSHEETPAGEW.Ptr

    pfnCallback : IntPtr

    hbmWatermark : HBITMAP

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HPALETTE</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Controls/common-control-versions">Version 5.80</a> or later. <b>HPALETTE</b> structure used for drawing the watermark bitmap and/or header bitmap. If the <b>dwFlags</b> member does not include PSH_USEHPLWATERMARK, this member is ignored.
     */
    hplWatermark : HPALETTE

    hbmHeader : HBITMAP

    static __New() {
        DefineProp(this.Prototype, 'pszIcon', { type: PWSTR, offset: 24 })
        DefineProp(this.Prototype, 'pStartPage', { type: PWSTR, offset: 48 })
        DefineProp(this.Prototype, 'phpage', { type: HPROPSHEETPAGE.Ptr, offset: 56 })
        DefineProp(this.Prototype, 'pszbmWatermark', { type: PWSTR, offset: 72 })
        DefineProp(this.Prototype, 'pszbmHeader', { type: PWSTR, offset: 88 })
        this.DeleteProp("__New")
    }
}
