#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WindowsAndMessaging\DLGTEMPLATE.ahk" { DLGTEMPLATE }
#Import "..\WindowsAndMessaging\DLGPROC.ahk" { DLGPROC }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\LPFNPSPCALLBACKA.ahk" { LPFNPSPCALLBACKA }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct PROPSHEETPAGEA {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    hInstance : HINSTANCE

    pszTemplate : PSTR

    hIcon : HICON

    pszTitle : PSTR

    pfnDlgProc : DLGPROC

    lParam : LPARAM

    pfnCallback : LPFNPSPCALLBACKA

    pcRefParent : IntPtr

    pszHeaderTitle : PSTR

    pszHeaderSubTitle : PSTR

    hActCtx : HANDLE

    hbmHeader : HBITMAP

    static __New() {
        DefineProp(this.Prototype, 'pResource', { type: DLGTEMPLATE.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'pszIcon', { type: PSTR, offset: 24 })
        DefineProp(this.Prototype, 'pszbmHeader', { type: PSTR, offset: 96 })
        this.DeleteProp("__New")
    }
}
