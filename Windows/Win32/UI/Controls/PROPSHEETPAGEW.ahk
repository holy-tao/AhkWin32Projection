#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\WindowsAndMessaging\DLGTEMPLATE.ahk" { DLGTEMPLATE }
#Import "..\WindowsAndMessaging\DLGPROC.ahk" { DLGPROC }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import ".\LPFNPSPCALLBACKW.ahk" { LPFNPSPCALLBACKW }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct PROPSHEETPAGEW {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    hInstance : HINSTANCE

    pszTemplate : PWSTR

    hIcon : HICON

    pszTitle : PWSTR

    pfnDlgProc : DLGPROC

    lParam : LPARAM

    pfnCallback : LPFNPSPCALLBACKW

    pcRefParent : IntPtr

    pszHeaderTitle : PWSTR

    pszHeaderSubTitle : PWSTR

    hActCtx : HANDLE

    hbmHeader : HBITMAP

    static __New() {
        DefineProp(this.Prototype, 'pResource', { type: DLGTEMPLATE.Ptr, offset: 16 })
        DefineProp(this.Prototype, 'pszIcon', { type: PWSTR, offset: 24 })
        DefineProp(this.Prototype, 'pszbmHeader', { type: PWSTR, offset: 96 })
        this.DeleteProp("__New")
    }
}
