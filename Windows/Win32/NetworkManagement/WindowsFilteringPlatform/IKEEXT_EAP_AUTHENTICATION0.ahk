#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_EAP_AUTHENTICATION_FLAGS.ahk" { IKEEXT_EAP_AUTHENTICATION_FLAGS }

/**
 * Stores information needed for Extensible Authentication Protocol (EAP) authentication.
 * @remarks
 * <b>IKEEXT_EAP_AUTHENTICATION0</b> is a specific implementation of IKEEXT_EAP_AUTHENTICATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_eap_authentication0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_EAP_AUTHENTICATION0 {
    #StructPack 4

    flags : IKEEXT_EAP_AUTHENTICATION_FLAGS

}
