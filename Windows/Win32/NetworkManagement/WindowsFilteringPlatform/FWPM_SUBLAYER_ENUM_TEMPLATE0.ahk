#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Is used for enumerating sublayers.
 * @remarks
 * <b>FWPM_SUBLAYER_ENUM_TEMPLATE0</b> is a specific implementation of FWPM_SUBLAYER_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_SUBLAYER_ENUM_TEMPLATE0 {
    #StructPack 8

    /**
     * Uniquely identifies the provider associated with this sublayer. If this value is non-NULL, only options with the specifies provider will be returned.
     */
    providerKey : Guid.Ptr

}
