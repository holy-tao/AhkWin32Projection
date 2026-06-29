#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct DRVCONFIGINFOEX {
    #StructPack 8

    dwDCISize : UInt32

    lpszDCISectionName : PWSTR

    lpszDCIAliasName : PWSTR

    dnDevNode : UInt32

}
