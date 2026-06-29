#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FLAT_STRING.ahk" { FLAT_STRING }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct NETWORK_NAME {
    #StructPack 2

    Name : FLAT_STRING

}
