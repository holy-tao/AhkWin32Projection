#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.UI.Shell
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct DRAGINFOA {
    #StructPack 8

    uSize : UInt32

    pt : POINT

    fNC : BOOL

    lpFileList : PSTR

    grfKeyState : UInt32

}
