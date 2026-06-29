#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }

/**
 * The OPENFILENAME_NT4 structure is identical to OPENFILENAME with _WIN32_WINNT set to 0x0400. (Unicode)
 * @see https://learn.microsoft.com/windows/win32/api/commdlg/ns-commdlg-openfilename_nt4w
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct OPENFILENAME_NT4W {
    #StructPack 8

    lStructSize : UInt32

    hwndOwner : HWND

    hInstance : HINSTANCE

    lpstrFilter : PWSTR

    lpstrCustomFilter : PWSTR

    nMaxCustFilter : UInt32

    nFilterIndex : UInt32

    lpstrFile : PWSTR

    nMaxFile : UInt32

    lpstrFileTitle : PWSTR

    nMaxFileTitle : UInt32

    lpstrInitialDir : PWSTR

    lpstrTitle : PWSTR

    Flags : UInt32

    nFileOffset : UInt16

    nFileExtension : UInt16

    lpstrDefExt : PWSTR

    lCustData : LPARAM

    lpfnHook : IntPtr

    lpTemplateName : PWSTR

}
