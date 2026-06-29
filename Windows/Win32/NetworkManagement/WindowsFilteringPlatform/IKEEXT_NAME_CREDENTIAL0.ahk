#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Is used to store credential name information.
 * @remarks
 * <b>IKEEXT_NAME_CREDENTIAL0</b> is a specific implementation of IKEEXT_NAME_CREDENTIAL. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_name_credential0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_NAME_CREDENTIAL0 {
    #StructPack 8

    /**
     * Name of the principal.
     */
    principalName : PWSTR

}
