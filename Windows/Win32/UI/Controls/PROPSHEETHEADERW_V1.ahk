#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROPSHEETPAGEW.ahk" { PROPSHEETPAGEW }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PROPSHEETHEADERW_V1 {
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

    static __New() {
        DefineProp(this.Prototype, 'pszIcon', { type: PWSTR, offset: 24 })
        DefineProp(this.Prototype, 'pStartPage', { type: PWSTR, offset: 48 })
        DefineProp(this.Prototype, 'phpage', { type: HPROPSHEETPAGE.Ptr, offset: 56 })
        this.DeleteProp("__New")
    }
}
