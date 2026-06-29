#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_DIRECTION.ahk" { DOT11_DIRECTION }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_CIPHER_KEY_MAPPING_KEY_VALUE {
    #StructPack 4

    PeerMacAddr : Int8[6]

    AlgorithmId : DOT11_CIPHER_ALGORITHM

    Direction : DOT11_DIRECTION

    bDelete : BOOLEAN

    bStatic : BOOLEAN

    usKeyLength : UInt16

    ucKey : Int8[1]

}
