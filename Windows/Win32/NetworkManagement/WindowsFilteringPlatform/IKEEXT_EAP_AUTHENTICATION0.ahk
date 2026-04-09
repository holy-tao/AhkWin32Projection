#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_EAP_AUTHENTICATION_FLAGS.ahk

/**
 * Stores information needed for Extensible Authentication Protocol (EAP) authentication.
 * @remarks
 * <b>IKEEXT_EAP_AUTHENTICATION0</b> is a specific implementation of IKEEXT_EAP_AUTHENTICATION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_eap_authentication0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IKEEXT_EAP_AUTHENTICATION0 extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {IKEEXT_EAP_AUTHENTICATION_FLAGS}
     */
    flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
