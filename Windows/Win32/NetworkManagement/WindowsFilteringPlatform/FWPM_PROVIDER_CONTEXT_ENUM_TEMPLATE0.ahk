#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_PROVIDER_CONTEXT_TYPE.ahk" { FWPM_PROVIDER_CONTEXT_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Used for enumerating provider contexts.
 * @remarks
 * <b>FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0</b> is a specific implementation of FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0 {
    #StructPack 8

    /**
     * Uniquely identifies a provider. If this value is non-NULL, only options with the specifies provider will be returned.
     */
    providerKey : Guid.Ptr

    /**
     * Only return provider contexts of the specified type.
     * 
     * See [FWPM_PROVIDER_CONTEXT_TYPE](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_provider_context_type) for more information.
     */
    providerContextType : FWPM_PROVIDER_CONTEXT_TYPE

}
