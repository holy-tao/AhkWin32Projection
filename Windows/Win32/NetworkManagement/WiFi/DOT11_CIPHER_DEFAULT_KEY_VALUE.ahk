#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_CIPHER_DEFAULT_KEY_VALUE {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    uKeyIndex : UInt32

    AlgorithmId : DOT11_CIPHER_ALGORITHM

    MacAddr : Int8[6]

    bDelete : BOOLEAN

    bStatic : BOOLEAN

    usKeyLength : UInt16

    ucKey : Int8[1]

}
