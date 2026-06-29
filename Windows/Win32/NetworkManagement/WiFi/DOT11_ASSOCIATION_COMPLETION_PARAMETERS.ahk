#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_DS_INFO.ahk" { DOT11_DS_INFO }
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_ASSOCIATION_COMPLETION_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    MacAddr : Int8[6]

    uStatus : UInt32

    bReAssocReq : BOOLEAN

    bReAssocResp : BOOLEAN

    uAssocReqOffset : UInt32

    uAssocReqSize : UInt32

    uAssocRespOffset : UInt32

    uAssocRespSize : UInt32

    uBeaconOffset : UInt32

    uBeaconSize : UInt32

    uIHVDataOffset : UInt32

    uIHVDataSize : UInt32

    AuthAlgo : DOT11_AUTH_ALGORITHM

    UnicastCipher : DOT11_CIPHER_ALGORITHM

    MulticastCipher : DOT11_CIPHER_ALGORITHM

    uActivePhyListOffset : UInt32

    uActivePhyListSize : UInt32

    bFourAddressSupported : BOOLEAN

    bPortAuthorized : BOOLEAN

    ucActiveQoSProtocol : Int8

    DSInfo : DOT11_DS_INFO

    uEncapTableOffset : UInt32

    uEncapTableSize : UInt32

    MulticastMgmtCipher : DOT11_CIPHER_ALGORITHM

    uAssocComebackTime : UInt32

}
