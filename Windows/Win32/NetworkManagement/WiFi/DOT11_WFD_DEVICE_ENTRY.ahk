#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO.ahk" { DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_DEVICE_ENTRY {
    #StructPack 8

    uPhyId : UInt32

    PhySpecificInfo : DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO

    dot11BSSID : Int8[6]

    dot11BSSType : DOT11_BSS_TYPE

    TransmitterAddress : Int8[6]

    lRSSI : Int32

    uLinkQuality : UInt32

    usBeaconPeriod : UInt16

    ullTimestamp : Int64

    ullBeaconHostTimestamp : Int64

    ullProbeResponseHostTimestamp : Int64

    usCapabilityInformation : UInt16

    uBeaconIEsOffset : UInt32

    uBeaconIEsLength : UInt32

    uProbeResponseIEsOffset : UInt32

    uProbeResponseIEsLength : UInt32

}
