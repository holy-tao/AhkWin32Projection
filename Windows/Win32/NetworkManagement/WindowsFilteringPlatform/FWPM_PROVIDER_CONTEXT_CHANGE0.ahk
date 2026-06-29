#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_CHANGE_TYPE.ahk" { FWPM_CHANGE_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Change notification dispatched to subscribers. (FWPM_PROVIDER_CONTEXT_CHANGE0)
 * @remarks
 * <b>FWPM_PROVIDER_CONTEXT_CHANGE0</b> is a specific implementation of FWPM_PROVIDER_CONTEXT_CHANGE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_change0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_PROVIDER_CONTEXT_CHANGE0 {
    #StructPack 8

    /**
     * Type of change.
     * 
     * See [FWPM_CHANGE_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_change_type) for more information.
     */
    changeType : FWPM_CHANGE_TYPE

    /**
     * GUID of the provider context that changed.
     */
    providerContextKey : Guid

    /**
     * LUID of the provider context that changed.
     */
    providerContextId : Int64

}
