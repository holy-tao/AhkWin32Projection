#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_RESET_TYPE.ahk" { DOT11_RESET_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_RESET_REQUEST {
    #StructPack 4

    dot11ResetType : DOT11_RESET_TYPE

    dot11MacAddress : Int8[6]

    bSetDefaultMIB : BOOLEAN

}
