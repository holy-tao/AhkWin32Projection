#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11EXT_VIRTUAL_STATION_AP_PROPERTY {
    #StructPack 4

    dot11SSID : DOT11_SSID

    dot11AuthAlgo : DOT11_AUTH_ALGORITHM

    dot11CipherAlgo : DOT11_CIPHER_ALGORITHM

    bIsPassPhrase : BOOL

    dwKeyLength : UInt32

    ucKeyData : Int8[64]

}
