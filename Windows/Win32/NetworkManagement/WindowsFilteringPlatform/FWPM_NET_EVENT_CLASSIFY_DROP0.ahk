#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that describes a layer drop failure. (FWPM_NET_EVENT_CLASSIFY_DROP0)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_classify_drop0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_CLASSIFY_DROP0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A LUID identifying the filter where the failure occurred.
     * @type {Integer}
     */
    filterId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the identifier of the filtering layer where the failure occurred.  For more information, see [Filtering Layer Identifiers](/windows/desktop/FWP/management-filtering-layer-identifiers-).
     * @type {Integer}
     */
    layerId {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }
}
