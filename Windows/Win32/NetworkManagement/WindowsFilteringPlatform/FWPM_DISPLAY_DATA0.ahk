#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Stores an optional friendly name and an optional description for an object.
 * @remarks
 * In order to
 * support MUI, both strings may contain indirect strings. See
 * <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-shloadindirectstring">SHLoadIndirectString</a> for details.
 * 
 * <b>FWPM_DISPLAY_DATA0</b> is a specific implementation of FWPM_DISPLAY_DATA. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwpm_display_data0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_DISPLAY_DATA0 {
    #StructPack 8

    /**
     * Optional friendly name.
     */
    name : PWSTR

    /**
     * Optional description.
     */
    description : PWSTR

}
