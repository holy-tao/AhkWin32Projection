#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_PHY_FRAME_STATISTICS.ahk" { DOT11_PHY_FRAME_STATISTICS }
#Import ".\DOT11_MAC_FRAME_STATISTICS.ahk" { DOT11_MAC_FRAME_STATISTICS }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_STATISTICS {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    ullFourWayHandshakeFailures : Int64

    ullTKIPCounterMeasuresInvoked : Int64

    ullReserved : Int64

    MacUcastCounters : DOT11_MAC_FRAME_STATISTICS

    MacMcastCounters : DOT11_MAC_FRAME_STATISTICS

    PhyCounters : DOT11_PHY_FRAME_STATISTICS[1]

}
