#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_CHANGE_TYPE.ahk" { FWPM_CHANGE_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Change notification dispatched to subscribers. (FWPM_SUBLAYER_CHANGE0)
 * @remarks
 * <b>FWPM_SUBLAYER_CHANGE0</b> is a specific implementation of FWPM_SUBLAYER_CHANGE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer_change0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_SUBLAYER_CHANGE0 {
    #StructPack 4

    /**
     * Type of change as specified by [FWPM_CHANGE_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_change_type).
     */
    changeType : FWPM_CHANGE_TYPE

    /**
     * GUID of the sublayer that changed.
     */
    subLayerKey : Guid

}
