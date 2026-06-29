#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASPPPIPXA {
    #StructPack 4

    dwSize : UInt32

    dwError : UInt32

    szIpxAddress : CHAR[22]

}
