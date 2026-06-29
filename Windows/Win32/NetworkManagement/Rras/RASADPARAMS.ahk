#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASADPARAMS {
    #StructPack 8

    dwSize : UInt32

    hwndOwner : HWND

    dwFlags : UInt32

    xDlg : Int32

    yDlg : Int32

}
