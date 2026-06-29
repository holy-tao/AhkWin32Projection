#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 */
export default struct RASAUTODIALENTRYA {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    dwDialingLocation : UInt32

    szEntry : CHAR[257]

}
