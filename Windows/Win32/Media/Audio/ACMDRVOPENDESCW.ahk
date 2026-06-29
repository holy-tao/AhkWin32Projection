#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset Unicode
 */
export default struct ACMDRVOPENDESCW {
    #StructPack 8

    cbStruct : UInt32

    fccType : UInt32

    fccComp : UInt32

    dwVersion : UInt32

    dwFlags : UInt32

    dwError : UInt32

    pszSectionName : PWSTR

    pszAliasName : PWSTR

    dnDevNode : UInt32

}
