#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct RASENTRYDLGA {
    #StructPack 8

    dwSize : UInt32

    hwndOwner : HWND

    dwFlags : UInt32

    xDlg : Int32

    yDlg : Int32

    szEntry : CHAR[257]

    dwError : UInt32

    reserved : IntPtr

    reserved2 : IntPtr

}
