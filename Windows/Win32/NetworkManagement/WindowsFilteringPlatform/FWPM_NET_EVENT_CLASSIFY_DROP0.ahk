#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information that describes a layer drop failure. (FWPM_NET_EVENT_CLASSIFY_DROP0)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_classify_drop0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_CLASSIFY_DROP0 {
    #StructPack 8

    /**
     * A LUID identifying the filter where the failure occurred.
     */
    filterId : Int64

    /**
     * Indicates the identifier of the filtering layer where the failure occurred.  For more information, see [Filtering Layer Identifiers](/windows/desktop/FWP/management-filtering-layer-identifiers-).
     */
    layerId : UInt16

}
