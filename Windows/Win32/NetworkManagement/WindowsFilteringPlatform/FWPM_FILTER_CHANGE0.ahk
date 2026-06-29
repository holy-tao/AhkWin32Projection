#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_CHANGE_TYPE.ahk" { FWPM_CHANGE_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Stores change notification dispatched to subscribers.
 * @remarks
 * <b>FWPM_FILTER_CHANGE0</b> is a specific implementation of FWPM_FILTER_CHANGE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_change0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_FILTER_CHANGE0 {
    #StructPack 8

    /**
     * A [FWPM_CHANGE_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_change_type) value that specifies the type of change notification to be dispatched.
     */
    changeType : FWPM_CHANGE_TYPE

    /**
     * GUID of the filter that changed.
     */
    filterKey : Guid

    /**
     * LUID of the filter that changed.
     */
    filterId : Int64

}
