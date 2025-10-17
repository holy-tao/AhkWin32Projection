#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that describes allowed traffic as enforced by the WFP classify engine.
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_net_event_classify_allow0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_CLASSIFY_ALLOW0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>UINT64</b>
     * 
     * A LUID identifying the WFP filter allowing this traffic.
     * @type {Integer}
     */
    filterId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * The identifier of the WFP filtering layer where the filter specified  in <b>filterId</b> is stored. For more information, see <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a>.
     * @type {Integer}
     */
    layerId {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The reason for reauthorizing a previously authorized connection.
     * @type {Integer}
     */
    reauthReason {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The identifier of the profile to which the packet was received (or from which the packet was sent).
     * @type {Integer}
     */
    originalProfile {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The identifier of the profile where the packet was when the failure occurred.
     * @type {Integer}
     */
    currentProfile {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Indicates the direction of the packet transmission. Possible values are <b>FWP_DIRECTION_INBOUND</b> or <b>FWP_DIRECTION_OUTBOUND</b>.
     * @type {Integer}
     */
    msFwpDirection {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * If true, indicates that the packet originated from (or was heading to) the loopback adapter; otherwise, false.
     * @type {BOOL}
     */
    isLoopback {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
