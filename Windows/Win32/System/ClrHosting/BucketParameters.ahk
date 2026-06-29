#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct BucketParameters {
    #StructPack 4

    fInited : BOOL

    pszEventTypeName : WCHAR[255]

    pszParams : WCHAR[2550]

}
