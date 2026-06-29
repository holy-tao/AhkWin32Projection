#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct ACMDRVOPENDESCA {
    #StructPack 8

    cbStruct : UInt32

    fccType : UInt32

    fccComp : UInt32

    dwVersion : UInt32

    dwFlags : UInt32

    dwError : UInt32

    pszSectionName : PSTR

    pszAliasName : PSTR

    dnDevNode : UInt32

}
