#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_LAYER_STATISTICS0.ahk" { FWPM_LAYER_STATISTICS0 }

/**
 * Stores statistics related to connections at specific layers.
 * @remarks
 * <b>FWPM_STATISTICS0</b> is a specific implementation of FWPM_STATISTICS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_STATISTICS0 {
    #StructPack 8

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of [FWPM_LAYER_STATISTICS0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_layer_statistics0) structures in the <b>layerStatistics</b> member.
     */
    numLayerStatistics : UInt32

    /**
     * Type: [FWPM_LAYER_STATISTICS0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_layer_statistics0)*</b>
     * 
     * Statistics related to the layer.
     */
    layerStatistics : FWPM_LAYER_STATISTICS0.Ptr

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of allowed IPv4 inbound connections.
     */
    inboundAllowedConnectionsV4 : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of blocked IPv4 inbound connections.
     */
    inboundBlockedConnectionsV4 : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of allowed IPv4 outbound connections.
     */
    outboundAllowedConnectionsV4 : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of blocked IPv4 outbound connections.
     */
    outboundBlockedConnectionsV4 : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of allowed IPv6 inbound connections.
     */
    inboundAllowedConnectionsV6 : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of blocked IPv6 inbound connections.
     */
    inboundBlockedConnectionsV6 : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of allowed IPv6 outbound connections.
     */
    outboundAllowedConnectionsV6 : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of blocked IPv6 outbound connections.
     */
    outboundBlockedConnectionsV6 : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of active IPv4 inbound connections.
     */
    inboundActiveConnectionsV4 : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of active IPv4 outbound connections.
     */
    outboundActiveConnectionsV4 : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of active IPv6 inbound connections.
     */
    inboundActiveConnectionsV6 : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of active IPv6 outbound connections.
     */
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
