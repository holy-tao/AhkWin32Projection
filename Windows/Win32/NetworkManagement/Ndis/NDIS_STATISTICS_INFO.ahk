#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_STATISTICS_INFO {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    SupportedStatistics : UInt32

    ifInDiscards : Int64

    ifInErrors : Int64

    ifHCInOctets : Int64

    ifHCInUcastPkts : Int64

    ifHCInMulticastPkts : Int64

    ifHCInBroadcastPkts : Int64

    ifHCOutOctets : Int64

    ifHCOutUcastPkts : Int64

    ifHCOutMulticastPkts : Int64

    ifHCOutBroadcastPkts : Int64

    ifOutErrors : Int64

    ifOutDiscards : Int64

    ifHCInUcastOctets : Int64

    ifHCInMulticastOctets : Int64

    ifHCInBroadcastOctets : Int64

    ifHCOutUcastOctets : Int64

    ifHCOutMulticastOctets : Int64

    ifHCOutBroadcastOctets : Int64

}
