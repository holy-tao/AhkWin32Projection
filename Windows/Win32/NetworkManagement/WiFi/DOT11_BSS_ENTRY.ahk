#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO.ahk" { DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO }
#Import ".\DOT11_BSS_TYPE.ahk" { DOT11_BSS_TYPE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_BSS_ENTRY {
    #StructPack 8

    uPhyId : UInt32

    PhySpecificInfo : DOT11_BSS_ENTRY_PHY_SPECIFIC_INFO

    dot11BSSID : Int8[6]

    dot11BSSType : DOT11_BSS_TYPE

    lRSSI : Int32

    uLinkQuality : UInt32

    bInRegDomain : BOOLEAN

    usBeaconPeriod : UInt16

    ullTimestamp : Int64

    ullHostTimestamp : Int64

    usCapabilityInformation : UInt16

    uBufferLength : UInt32

    ucBuffer : Int8[1]

}
