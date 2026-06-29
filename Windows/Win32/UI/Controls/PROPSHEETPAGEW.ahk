#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\WindowsAndMessaging\DLGTEMPLATE.ahk" { DLGTEMPLATE }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }

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

    pfnDlgProc : IntPtr

    lParam : LPARAM

    pfnCallback : IntPtr

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
