#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used for enumerating layers.
 * @remarks
 * Currently, there is no way to limit the
 * enumeration — all layers are returned.
 * 
 * <b>FWPM_LAYER_ENUM_TEMPLATE0</b> is a specific implementation of FWPM_LAYER_ENUM_TEMPLATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_layer_enum_template0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_LAYER_ENUM_TEMPLATE0 {
    #StructPack 8

    /**
     * Reserved for system use.
     */
    reserved : Int64

}
