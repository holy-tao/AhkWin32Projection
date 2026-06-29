#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_ATTRIBUTES {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    uNumConcurrentGORole : UInt32

    uNumConcurrentClientRole : UInt32

    WPSVersionsSupported : UInt32

    bServiceDiscoverySupported : BOOLEAN

    bClientDiscoverabilitySupported : BOOLEAN

    bInfrastructureManagementSupported : BOOLEAN

    uMaxSecondaryDeviceTypeListSize : UInt32

    DeviceAddress : Int8[6]

    uInterfaceAddressListCount : UInt32

    pInterfaceAddressList : IntPtr

    uNumSupportedCountryOrRegionStrings : UInt32

    pSupportedCountryOrRegionStrings : IntPtr

    uDiscoveryFilterListSize : UInt32

    uGORoleClientTableSize : UInt32

}
