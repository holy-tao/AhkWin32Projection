#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_WFD_CHANNEL.ahk" { DOT11_WFD_CHANNEL }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_WFD_GROUP_JOIN_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    GOOperatingChannel : DOT11_WFD_CHANNEL

    GOConfigTime : UInt32

    bInGroupFormation : BOOLEAN

    bWaitForWPSReady : BOOLEAN

}
