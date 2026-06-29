#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_SUBSCRIPTION_FLAGS.ahk" { FWPM_SUBSCRIPTION_FLAGS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0.ahk" { FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0 }

/**
 * Used to subscribe for change notifications. (FWPM_PROVIDER_CONTEXT_SUBSCRIPTION0)
 * @remarks
 * <b>FWPM_PROVIDER_CONTEXT_SUBSCRIPTION0</b> is a specific implementation of FWPM_PROVIDER_CONTEXT_SUBSCRIPTION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_subscription0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_PROVIDER_CONTEXT_SUBSCRIPTION0 {
    #StructPack 8

    /**
     * Notifications are only dispatched for objects that match the template. If the template is <b>NULL</b>, it matches all objects.
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_enum_template0">FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0</a> for more information
     */
    enumTemplate : FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0.Ptr

    flags : FWPM_SUBSCRIPTION_FLAGS

    /**
     * Uniquely identifies this session.
     */
    sessionKey : Guid

}
