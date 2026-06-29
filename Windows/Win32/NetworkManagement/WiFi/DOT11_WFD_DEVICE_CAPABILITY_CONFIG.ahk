#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_DEVICE_CAPABILITY_CONFIG {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    bServiceDiscoveryEnabled : BOOLEAN

    bClientDiscoverabilityEnabled : BOOLEAN

    bConcurrentOperationSupported : BOOLEAN

    bInfrastructureManagementEnabled : BOOLEAN

    bDeviceLimitReached : BOOLEAN

    bInvitationProcedureEnabled : BOOLEAN

    WPSVersionsEnabled : UInt32

}
