#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_LAYER_STATISTICS1.ahk" { FWPM_LAYER_STATISTICS1 }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_STATISTICS1 {
    #StructPack 8

    numLayerStatistics : UInt32

    layerStatistics : FWPM_LAYER_STATISTICS1.Ptr

    inboundAllowedConnectionsV4 : UInt32

    inboundBlockedConnectionsV4 : UInt32

    outboundAllowedConnectionsV4 : UInt32

    outboundBlockedConnectionsV4 : UInt32

    inboundAllowedConnectionsV6 : UInt32

    inboundBlockedConnectionsV6 : UInt32

    outboundAllowedConnectionsV6 : UInt32

    outboundBlockedConnectionsV6 : UInt32

    inboundActiveConnectionsV4 : UInt32

    outboundActiveConnectionsV4 : UInt32

    inboundActiveConnectionsV6 : UInt32

    outboundActiveConnectionsV6 : UInt32

    reauthDirInbound : Int64

    reauthDirOutbound : Int64

    reauthFamilyV4 : Int64

    reauthFamilyV6 : Int64

    reauthProtoOther : Int64

    reauthProtoIPv4 : Int64

    reauthProtoIPv6 : Int64

    reauthProtoICMP : Int64

    reauthProtoICMP6 : Int64

    reauthProtoUDP : Int64

    reauthProtoTCP : Int64

    reauthReasonPolicyChange : Int64

    reauthReasonNewArrivalInterface : Int64

    reauthReasonNewNextHopInterface : Int64

    reauthReasonProfileCrossing : Int64

    reauthReasonClassifyCompletion : Int64

    reauthReasonIPSecPropertiesChanged : Int64

    reauthReasonMidStreamInspection : Int64

    reauthReasonSocketPropertyChanged : Int64

    reauthReasonNewInboundMCastBCastPacket : Int64

    reauthReasonEDPPolicyChanged : Int64

    reauthReasonProxyHandleChanged : Int64

}
