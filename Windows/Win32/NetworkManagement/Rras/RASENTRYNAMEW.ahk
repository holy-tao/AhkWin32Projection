#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset Unicode
 */
export default struct RASENTRYNAMEW {
    #StructPack 4

    dwSize : UInt32

    szEntryName : WCHAR[257]

    dwFlags : UInt32

    szPhonebookPath : WCHAR[261]

}
