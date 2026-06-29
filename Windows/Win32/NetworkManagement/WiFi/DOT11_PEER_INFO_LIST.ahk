#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_POWER_MODE.ahk" { DOT11_POWER_MODE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }
#Import ".\DOT11_PEER_STATISTICS.ahk" { DOT11_PEER_STATISTICS }
#Import ".\DOT11_PEER_INFO.ahk" { DOT11_PEER_INFO }
#Import ".\DOT11_ASSOCIATION_STATE.ahk" { DOT11_ASSOCIATION_STATE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PEER_INFO_LIST {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    uNumOfEntries : UInt32

    uTotalNumOfEntries : UInt32

    PeerInfo : DOT11_PEER_INFO[1]

}
