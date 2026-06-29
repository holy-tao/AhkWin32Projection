#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 */
export default struct RASPPPIPA {
    #StructPack 4

    dwSize : UInt32

    dwError : UInt32

    szIpAddress : CHAR[16]

    szServerIpAddress : CHAR[16]

    dwOptions : UInt32

    dwServerOptions : UInt32

}
