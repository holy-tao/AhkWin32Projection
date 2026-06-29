#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Restore
 */
export default struct RESTOREPOINTINFOEX {
    #StructPack 4

    ftCreation : FILETIME

    dwEventType : UInt32

    dwRestorePtType : UInt32

    dwRPNum : UInt32

    szDescription : WCHAR[256]

}
