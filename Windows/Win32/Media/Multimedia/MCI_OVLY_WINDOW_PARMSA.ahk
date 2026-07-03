#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @charset ANSI
 */
export default struct MCI_OVLY_WINDOW_PARMSA {
    #StructPack 8

    dwCallback : IntPtr

    hWnd : HWND

    nCmdShow : UInt32

    lpstrText : PSTR

}
