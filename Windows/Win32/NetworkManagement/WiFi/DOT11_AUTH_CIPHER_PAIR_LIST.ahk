#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_AUTH_CIPHER_PAIR.ahk" { DOT11_AUTH_CIPHER_PAIR }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_AUTH_CIPHER_PAIR_LIST {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    AuthCipherPairs : DOT11_AUTH_CIPHER_PAIR[1]

}
