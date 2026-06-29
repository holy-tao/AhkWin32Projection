#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information that describes a layer drop failure. (FWPM_NET_EVENT_CLASSIFY_DROP1)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_classify_drop1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_CLASSIFY_DROP1 {
    #StructPack 8

    /**
     * A LUID identifying the filter where the failure occurred.
     */
    filterId : Int64

    /**
     * Indicates the identifier of the filtering layer where the failure occurred.  For more information, see [Filtering Layer Identifiers](/windows/desktop/FWP/management-filtering-layer-identifiers-).
     */
    layerId : UInt16

    /**
     * Indicates the reason for reauthorizing a previously authorized connection.
     */
    reauthReason : UInt32

    /**
     * Indicates the identifier of the profile to which  the  packet was received (or from which the packet was sent).
     */
    originalProfile : UInt32

    /**
     * Indicates the identifier of the profile where the packet was when the failure occurred.
     */
    currentProfile : UInt32

    /**
     * Indicates the direction of the packet transmission.
     * 
     * Possible values:
     * 
     * | Value | Meaning |
     * | ----- | ------- |
     * | FWP_DIRECTION_IN <br/> 0x00003900L | The packet is inbound. |
     * | FWP_DIRECTION_OUT <br/> 0x00003901L | The packet is outbound. |
     * | FWP_DIRECTION_FORWARD <br/> 0x00003902L | The packet is traversing an interface which it must pass through on the way to its destination. |
     */
    msFwpDirection : UInt32

    /**
     * Indicates whether the packet originated from (or was heading to) the loopback adapter.
     */
    isLoopback : BOOL

}
