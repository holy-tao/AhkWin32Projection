#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains information that describes a layer drop failure.
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_net_event_classify_drop1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_CLASSIFY_DROP1 extends Win32Struct
{
    static sizeof => 32

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

    /**
     * Indicates the reason for reauthorizing a previously authorized connection.
     * @type {Integer}
     */
    reauthReason {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Indicates the identifier of the profile to which  the  packet was received (or from which the packet was sent).
     * @type {Integer}
     */
    originalProfile {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Indicates the identifier of the profile where the packet was when the failure occurred.
     * @type {Integer}
     */
    currentProfile {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

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
     * @type {Integer}
     */
    msFwpDirection {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Indicates whether the packet originated from (or was heading to) the loopback adapter.
     * @type {BOOL}
     */
    isLoopback{
        get {
            if(!this.HasProp("__isLoopback"))
                this.__isLoopback := BOOL(this.ptr + 28)
            return this.__isLoopback
        }
    }
}
