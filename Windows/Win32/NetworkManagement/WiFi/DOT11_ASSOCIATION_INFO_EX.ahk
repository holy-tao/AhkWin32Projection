#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_POWER_MODE.ahk" { DOT11_POWER_MODE }
#Import ".\DOT11_ASSOCIATION_STATE.ahk" { DOT11_ASSOCIATION_STATE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_ASSOCIATION_INFO_EX {
    #StructPack 8

    PeerMacAddress : Int8[6]

    BSSID : Int8[6]

    usCapabilityInformation : UInt16

    usListenInterval : UInt16

    ucPeerSupportedRates : Int8[255]

    usAssociationID : UInt16

    dot11AssociationState : DOT11_ASSOCIATION_STATE

    dot11PowerMode : DOT11_POWER_MODE

    liAssociationUpTime : Int64

    ullNumOfTxPacketSuccesses : Int64

    ullNumOfTxPacketFailures : Int64

    ullNumOfRxPacketSuccesses : Int64

    ullNumOfRxPacketFailures : Int64

}
