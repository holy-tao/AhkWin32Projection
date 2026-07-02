#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\PROPSHEETPAGEA.ahk" { PROPSHEETPAGEA }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\PFNPROPSHEETCALLBACK.ahk" { PFNPROPSHEETCALLBACK }
#Import ".\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PROPSHEETHEADERA_V1 {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    hwndParent : HWND

    hInstance : HINSTANCE

    hIcon : HICON

    pszCaption : PSTR

    nPages : UInt32

    nStartPage : UInt32

    ppsp : PROPSHEETPAGEA.Ptr

    pfnCallback : PFNPROPSHEETCALLBACK

    static __New() {
        DefineProp(this.Prototype, 'pszIcon', { type: PSTR, offset: 24 })
        DefineProp(this.Prototype, 'pStartPage', { type: PSTR, offset: 48 })
        DefineProp(this.Prototype, 'phpage', { type: HPROPSHEETPAGE.Ptr, offset: 56 })
        this.DeleteProp("__New")
    }
}
