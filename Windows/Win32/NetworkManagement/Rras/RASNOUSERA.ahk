#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 */
export default struct RASNOUSERA {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    dwTimeoutMs : UInt32

    szUserName : CHAR[257]

    szPassword : CHAR[257]

    szDomain : CHAR[16]

}
