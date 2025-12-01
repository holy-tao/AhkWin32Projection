#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores information used to subscribe to notifications about a network event.
 * @remarks
 * <b>FWPM_NET_EVENT_SUBSCRIPTION0</b> is a specific implementation of FWPM_NET_EVENT_SUBSCRIPTION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_subscription0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_NET_EVENT_SUBSCRIPTION0 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Address of an [FWPM_NET_EVENT_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_enum_template0) structure. Notifications are only dispatched for objects that match the template. If
     *    <b>enumTemplate</b> is <b>NULL</b>, it matches all objects.
     * @type {Pointer<FWPM_NET_EVENT_ENUM_TEMPLATE0>}
     */
    enumTemplate {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Unused.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Identifies the session which created the subscription.
     * @type {Pointer<Guid>}
     */
    sessionKey {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
