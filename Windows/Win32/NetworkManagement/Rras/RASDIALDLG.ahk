#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASDIALDLG {
    #StructPack 8

    dwSize : UInt32

    hwndOwner : HWND

    dwFlags : UInt32

    xDlg : Int32

    yDlg : Int32

    dwSubEntry : UInt32

    dwError : UInt32

    reserved : IntPtr

    reserved2 : IntPtr

}
