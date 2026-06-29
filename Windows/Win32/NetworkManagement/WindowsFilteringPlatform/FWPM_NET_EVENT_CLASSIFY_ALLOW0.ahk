#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information that describes allowed traffic as enforced by the WFP classify engine.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_classify_allow0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_CLASSIFY_ALLOW0 {
    #StructPack 8

    /**
     * Type: <b>UINT64</b>
     * 
     * A LUID identifying the WFP filter allowing this traffic.
     */
    filterId : Int64

    /**
     * Type: <b>UINT16</b>
     * 
     * The identifier of the WFP filtering layer where the filter specified  in <b>filterId</b> is stored. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a>.
     */
    layerId : UInt16

    /**
     * Type: <b>UINT32</b>
     * 
     * The reason for reauthorizing a previously authorized connection.
     */
    reauthReason : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * The identifier of the profile to which the packet was received (or from which the packet was sent).
     */
    originalProfile : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * The identifier of the profile where the packet was when the failure occurred.
     */
    currentProfile : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * Indicates the direction of the packet transmission. Possible values are <b>FWP_DIRECTION_INBOUND</b> or <b>FWP_DIRECTION_OUTBOUND</b>.
     */
    msFwpDirection : UInt32

    /**
     * Type: <b>BOOL</b>
     * 
     * If true, indicates that the packet originated from (or was heading to) the loopback adapter; otherwise, false.
     */
    isLoopback : BOOL

}
