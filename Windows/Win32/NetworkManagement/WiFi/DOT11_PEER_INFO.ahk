#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_POWER_MODE.ahk" { DOT11_POWER_MODE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }
#Import ".\DOT11_PEER_STATISTICS.ahk" { DOT11_PEER_STATISTICS }
#Import ".\DOT11_ASSOCIATION_STATE.ahk" { DOT11_ASSOCIATION_STATE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PEER_INFO {
    #StructPack 8

    MacAddress : Int8[6]

    usCapabilityInformation : UInt16

    AuthAlgo : DOT11_AUTH_ALGORITHM

    UnicastCipherAlgo : DOT11_CIPHER_ALGORITHM

    MulticastCipherAlgo : DOT11_CIPHER_ALGORITHM

    bWpsEnabled : BOOLEAN

    usListenInterval : UInt16

    ucSupportedRates : Int8[255]

    usAssociationID : UInt16

    AssociationState : DOT11_ASSOCIATION_STATE

    PowerMode : DOT11_POWER_MODE

    liAssociationUpTime : Int64

    Statistics : DOT11_PEER_STATISTICS

}
