#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @charset Unicode
 */
export default struct PERUSERSECTIONW {
    #StructPack 4

    szGUID : WCHAR[59]

    szDispName : WCHAR[128]

    szLocale : WCHAR[10]

    szStub : WCHAR[1040]

    szVersion : WCHAR[32]

    szCompID : WCHAR[128]

    dwIsInstalled : UInt32

    bRollback : BOOL

}
