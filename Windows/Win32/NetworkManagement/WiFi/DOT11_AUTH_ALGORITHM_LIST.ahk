#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_AUTH_ALGORITHM_LIST {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    AlgorithmIds : DOT11_AUTH_ALGORITHM[1]

}
