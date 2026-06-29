#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWPM_VSWITCH_EVENT_TYPE.ahk" { FWPM_VSWITCH_EVENT_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about a vSwitch event.
 * @remarks
 * For the unnamed union, switch_is(eventType), switch_type(FWPM_VSWITCH_EVENT_TYPE).
 * 
 * <b>FWPM_VSWITCH_EVENT0</b> is a specific implementation of FWPM_VSWITCH_EVENT. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_vswitch_event0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_VSWITCH_EVENT0 {
    #StructPack 8


    struct _positionInfo {
        numvSwitchFilterExtensions : UInt32

        vSwitchFilterExtensions : PWSTR.Ptr

    }

    struct _reorderInfo {
        inRequiredPosition : BOOL

        numvSwitchFilterExtensions : UInt32

        vSwitchFilterExtensions : PWSTR.Ptr

    }

    /**
     * Type: [FWPM_VSWITCH_EVENT_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_vswitch_event_type)</b>
     * 
     * The type of vSwitch event.
     */
    eventType : FWPM_VSWITCH_EVENT_TYPE

    /**
     * Type: <b>wchar_t*</b>
     * 
     * GUID that identifies a vSwitch.
     */
    vSwitchId : PWSTR

    positionInfo : FWPM_VSWITCH_EVENT0._positionInfo

    static __New() {
        DefineProp(this.Prototype, 'reorderInfo', { type: FWPM_VSWITCH_EVENT0._reorderInfo, offset: 16 })
        this.DeleteProp("__New")
    }
}
