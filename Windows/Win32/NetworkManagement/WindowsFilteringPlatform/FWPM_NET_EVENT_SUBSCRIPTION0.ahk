#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_NET_EVENT_ENUM_TEMPLATE0.ahk" { FWPM_NET_EVENT_ENUM_TEMPLATE0 }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Stores information used to subscribe to notifications about a network event.
 * @remarks
 * <b>FWPM_NET_EVENT_SUBSCRIPTION0</b> is a specific implementation of FWPM_NET_EVENT_SUBSCRIPTION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_subscription0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_SUBSCRIPTION0 {
    #StructPack 8

    /**
     * Address of an [FWPM_NET_EVENT_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_enum_template0) structure. Notifications are only dispatched for objects that match the template. If
     *    <b>enumTemplate</b> is <b>NULL</b>, it matches all objects.
     */
    enumTemplate : FWPM_NET_EVENT_ENUM_TEMPLATE0.Ptr

    /**
     * Unused.
     */
    flags : UInt32

    /**
     * Identifies the session which created the subscription.
     */
    sessionKey : Guid

}
