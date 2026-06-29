#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RASEAPINFO.ahk" { RASEAPINFO }
#Import ".\RASDEVSPECIFICINFO.ahk" { RASDEVSPECIFICINFO }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

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
