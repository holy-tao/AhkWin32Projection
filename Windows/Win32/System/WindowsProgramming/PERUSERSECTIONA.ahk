#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @charset ANSI
 */
export default struct PERUSERSECTIONA {
    #StructPack 4

    szGUID : CHAR[59]

    szDispName : CHAR[128]

    szLocale : CHAR[10]

    szStub : CHAR[1040]

    szVersion : CHAR[32]

    szCompID : CHAR[128]

    dwIsInstalled : UInt32

    bRollback : BOOL

}
