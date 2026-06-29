#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Used for limiting callout enumerations.
 * @remarks
 * <b>FWPM_CALLOUT_ENUM_TEMPLATE0</b> is a specific implementation of FWPM_CALLOUT_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_callout_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_CALLOUT_ENUM_TEMPLATE0 {
    #StructPack 8

    /**
     * Uniquely identifies the provider associated with the callout. If this member is non-NULL, only objects associated with the specified provider will be returned.
     */
    providerKey : Guid.Ptr

    /**
     * Uniquely identifies a layer. If this member is non-NULL, only callouts associated with the specified layer will be returned.
     */
    layerKey : Guid

}
