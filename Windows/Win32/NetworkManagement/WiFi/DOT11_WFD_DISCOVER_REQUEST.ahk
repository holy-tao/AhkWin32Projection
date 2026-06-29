#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_WFD_SCAN_TYPE.ahk" { DOT11_WFD_SCAN_TYPE }
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_WFD_DISCOVER_TYPE.ahk" { DOT11_WFD_DISCOVER_TYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_DISCOVER_REQUEST {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    DiscoverType : DOT11_WFD_DISCOVER_TYPE

    ScanType : DOT11_WFD_SCAN_TYPE

    uDiscoverTimeout : UInt32

    uDeviceFilterListOffset : UInt32

    uNumDeviceFilters : UInt32

    uIEsOffset : UInt32

    uIEsLength : UInt32

    bForceScanLegacyNetworks : BOOLEAN

}
