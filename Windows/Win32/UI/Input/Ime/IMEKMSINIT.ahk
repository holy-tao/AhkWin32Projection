#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEKMSINIT {
    #StructPack 8

    cbSize : Int32 := this.Size

    hWnd : HWND

}
