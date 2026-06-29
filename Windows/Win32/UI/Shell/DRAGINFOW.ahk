#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.UI.Shell
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct DRAGINFOW {
    #StructPack 8

    uSize : UInt32

    pt : POINT

    fNC : BOOL

    lpFileList : PWSTR

    grfKeyState : UInt32

}
