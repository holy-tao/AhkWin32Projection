#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The OPENFILENAME_NT4 structure is identical to OPENFILENAME with _WIN32_WINNT set to 0x0400. (ANSI)
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilename_nt4a
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct OPENFILENAME_NT4A {
    #StructPack 8

    lStructSize : UInt32

    hwndOwner : HWND

    hInstance : HINSTANCE

    lpstrFilter : PSTR

    lpstrCustomFilter : PSTR

    nMaxCustFilter : UInt32

    nFilterIndex : UInt32

    lpstrFile : PSTR

    nMaxFile : UInt32

    lpstrFileTitle : PSTR

    nMaxFileTitle : UInt32

    lpstrInitialDir : PSTR

    lpstrTitle : PSTR

    Flags : UInt32

    nFileOffset : UInt16

    nFileExtension : UInt16

    lpstrDefExt : PSTR

    lCustData : LPARAM

    lpfnHook : IntPtr

    lpTemplateName : PSTR

}
