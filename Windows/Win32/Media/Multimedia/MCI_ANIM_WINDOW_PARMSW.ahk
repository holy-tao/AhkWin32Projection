#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @charset Unicode
 */
export default struct MCI_ANIM_WINDOW_PARMSW {
    #StructPack 8

    dwCallback : IntPtr

    hWnd : HWND

    nCmdShow : UInt32

    lpstrText : PWSTR

}
