#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 */
export default struct RASENTRYNAMEA {
    #StructPack 4

    dwSize : UInt32

    szEntryName : CHAR[257]

    dwFlags : UInt32

    szPhonebookPath : CHAR[261]

}
