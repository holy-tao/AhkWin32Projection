#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores statistics related to connections at specific layers.
 * @remarks
 * <b>FWPM_STATISTICS0</b> is a specific implementation of FWPM_STATISTICS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_STATISTICS0 extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of [FWPM_LAYER_STATISTICS0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_layer_statistics0) structures in the <b>layerStatistics</b> member.
     * @type {Integer}
     */
    numLayerStatistics {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: [FWPM_LAYER_STATISTICS0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_layer_statistics0)*</b>
     * 
     * Statistics related to the layer.
     * @type {Pointer<FWPM_LAYER_STATISTICS0>}
     */
    layerStatistics {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of allowed IPv4 inbound connections.
     * @type {Integer}
     */
    inboundAllowedConnectionsV4 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of blocked IPv4 inbound connections.
     * @type {Integer}
     */
    inboundBlockedConnectionsV4 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of allowed IPv4 outbound connections.
     * @type {Integer}
     */
    outboundAllowedConnectionsV4 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of blocked IPv4 outbound connections.
     * @type {Integer}
     */
    outboundBlockedConnectionsV4 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of allowed IPv6 inbound connections.
     * @type {Integer}
     */
    inboundAllowedConnectionsV6 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of blocked IPv6 inbound connections.
     * @type {Integer}
     */
    inboundBlockedConnectionsV6 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of allowed IPv6 outbound connections.
     * @type {Integer}
     */
    outboundAllowedConnectionsV6 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of blocked IPv6 outbound connections.
     * @type {Integer}
     */
    outboundBlockedConnectionsV6 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of active IPv4 inbound connections.
     * @type {Integer}
     */
    inboundActiveConnectionsV4 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of active IPv4 outbound connections.
     * @type {Integer}
     */
    outboundActiveConnectionsV4 {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of active IPv6 inbound connections.
     * @type {Integer}
     */
    inboundActiveConnectionsV6 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Number of active IPv6 outbound connections.
     * @type {Integer}
     */
    outboundActiveConnectionsV6 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthDirInbound {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthDirOutbound {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthFamilyV4 {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthFamilyV6 {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthProtoOther {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthProtoIPv4 {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthProtoIPv6 {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthProtoICMP {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthProtoICMP6 {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthProtoUDP {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthProtoTCP {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthReasonPolicyChange {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthReasonNewArrivalInterface {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthReasonNewNextHopInterface {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthReasonProfileCrossing {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthReasonClassifyCompletion {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthReasonIPSecPropertiesChanged {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthReasonMidStreamInspection {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthReasonSocketPropertyChanged {
        get => NumGet(this, 208, "uint")
        set => NumPut("uint", value, this, 208)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthReasonNewInboundMCastBCastPacket {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthReasonEDPPolicyChanged {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * 
     * @type {Integer}
     */
    reauthReasonProxyHandleChanged {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }
}
