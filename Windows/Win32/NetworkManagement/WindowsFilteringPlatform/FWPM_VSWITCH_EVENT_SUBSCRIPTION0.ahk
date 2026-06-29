#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Stores information used to subscribe to notifications about a vSwitch event.
 * @remarks
 * <b>FWPM_VSWITCH_EVENT_SUBSCRIPTION0</b> is a specific implementation of FWPM_VSWITCH_EVENT_SUBSCRIPTION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_vswitch_event_subscription0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_VSWITCH_EVENT_SUBSCRIPTION0 {
    #StructPack 4

    /**
     * Type: <b>UINT32</b>
     * 
     * This member is reserved for future use.
     */
    flags : UInt32

    /**
     * Type: <b>GUID</b>
     * 
     * Identifies the session which created the subscription.
     */
    sessionKey : Guid

}
