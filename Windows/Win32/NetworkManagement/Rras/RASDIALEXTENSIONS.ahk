#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\RASDEVSPECIFICINFO.ahk" { RASDEVSPECIFICINFO }
#Import ".\RASEAPINFO.ahk" { RASEAPINFO }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASDIALEXTENSIONS {
    #StructPack 8

    dwSize : UInt32

    dwfOptions : UInt32

    hwndParent : HWND

    reserved : IntPtr

    reserved1 : IntPtr

    RasEapInfo : RASEAPINFO

    fSkipPppAuth : BOOL

    RasDevSpecificInfo : RASDEVSPECIFICINFO

}
